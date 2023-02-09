#!/bin/bash
# while true
# read -p "Enter the Table name: " tablename
# do
#     if [[ $tablename = [A-Za-z]*([A-Z]|[_-]|[a-z]|[0-9]) ]];
#         then
#             if ! [[ -e ~/DB/$1/$tablename ]];
#             then
#                 echo "----------------------------------------"
#                 echo "-------Table name is not exist-------"
#                 echo "----------------------------------------"
#             else
#                 break
#             fi
#         else
#             echo "--------------------------------------------------------------------------------------------------"
#             echo "---------The Table name must begin with a letter and not contain any special character---------"
#             echo "--------------------------------------------------------------------------------------------------"
#     fi
# done

source TableValidation.sh 1
while true
read -p "Which field use to update in [$tablename]: " fieldname
do
    if [[ $fieldname = [A-Za-z]*([A-Z]|[_-]|[a-z]|[0-9]) ]];
    then
        if [[ $(cut -d":" -f 1 $tablename".meta" | grep "$fieldname") ]];
        then
            read -p "Enter the data which in [$fieldname] field: " data
            fieldnum=$( awk -F: -v fieldname=$fieldname '{if($1==fieldname)print NR}' ~/DB/$1/$tablename.meta )
            break
        else
            echo "----------------------------------------"
            echo "-----Field name is not exist------"
            echo "----------------------------------------"
        fi
    else
        echo "--------------------------------------------------------------------------------------------------"
        echo "---------The Field name must begin with a letter and not contain any special character---------"
        echo "--------------------------------------------------------------------------------------------------"
    fi  
done

while true
do
    NumberOfRowUpdated=0
    read -p "Which field you want to update in [$tablename]: " updatablefield
    if [[ $updatablefield = [A-Za-z]*([A-Z]|[_-]|[a-z]|[0-9]) ]];
    then
        if [[ $(cut -d":" -f 1 $tablename".meta" | grep "$updatablefield") ]];
        then
            updatablefieldnum=$( awk -F: -v updatablefield=$updatablefield '{if($1==updatablefield)print NR}' ~/DB/$1/$tablename.meta )
            FieldType=$( awk -F: -v fieldname=$updatablefield '{if($1==fieldname)print $2}' ~/DB/$1/$tablename.meta )
            touch ~/DB/$1/temp

            while true
            read -p "Enter the updatable value in [[$updatablefield]] field [$1] : " FieldValue
            do
                if [ $FieldType = "Int" ];
                then
                    if [[ $FieldValue =  +([0-9]) ]];
                    then
                        awk -F: -v data=$data -v fieldnum=$fieldnum -v updatablefieldnum=$updatablefieldnum -v FieldValue=$FieldValue 'BEGIN {OFS = FS} {if($fieldnum==data){$updatablefieldnum=FieldValue;} print $0}' ~/DB/$1/$tablename > ~/DB/$1/temp
                        break
                    else
                        echo "----------------------------------------"
                        echo "---------the value should be int--------"
                        echo "----------------------------------------"
                        continue
                    fi
                else
                    awk -F: -v data=$data -v fieldnum=$fieldnum -v updatablefieldnum=$updatablefieldnum -v FieldValue=$FieldValue 'BEGIN {OFS = FS} {if($fieldnum==data){$updatablefieldnum=FieldValue;} print $0}' ~/DB/$1/$tablename > ~/DB/$1/temp
                    break
                fi
            done

            NumberOfRowUpdated=`diff ~/DB/$1/temp ~/DB/$1/$tablename | wc -l`
            NumberOfRowUpdated=$(( ($NumberOfRowUpdated -2)/2  ))
            cat ~/DB/$1/temp > ~/DB/$1/$tablename
            rm -f ~/DB/$1/temp
            read -N 1 -p "Are you want another update [y/n]? " check
            while true
            do
                if [[ $check = "y" ]]
                then
                    echo
                    continue 2
                elif [[ $check = "n" ]] 
                then
                    echo
                    break 2
                else
                    echo "Enter "y" for YES "n" for NO "
                fi
            done

        else
            echo "----------------------------------------"
            echo "-----Field name is not exist------"
            echo "----------------------------------------"
        fi
    else
        echo "--------------------------------------------------------------------------------------------------"
        echo "---------The Field name must begin with a letter and not contain any special character---------"
        echo "--------------------------------------------------------------------------------------------------"
    fi  
done
if (( $NumberOfRowUpdated < 0 ));
then
    echo "----------------------------------------"
    echo "----- 0 rows is updated ------"
    echo "----------------------------------------"
else
    echo "----------------------------------------"
    echo "-----$NumberOfRowUpdated rows is updated------"
    echo "----------------------------------------"
fi
source QueryMenu.sh


