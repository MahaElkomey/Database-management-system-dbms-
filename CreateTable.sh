#!/bin/bash
# while true
# read -p "Enter table name: " tablename
# do
#     if [[ $tablename = [A-Za-z]*([A-Z]|[_-]|[a-z]|[0-9]) ]];
#     then
#         if ! [[ -e ~/DB/$1/$tablename ]];
#             then
#                 break
#             else
#                 echo "----------------------------------------"
#                 echo "-----Table name is alredy exist------"
#                 echo "----------------------------------------"
#         fi
#     else
#         echo "--------------------------------------------------------------------------------------------------"
#         echo "---------The database name must begin with a letter and not contain any special character---------"
#         echo "--------------------------------------------------------------------------------------------------"
#     fi
# done

source TableValidation.sh 0
touch "$tablename" "$tablename"".meta"
while true
read -p "Enter number of table fields (max number of feilds 9) : " fieldSizes
do
    if [[ $fieldSizes = [0-9] ]]
    then
        echo "--------------------------------------------------------------------------------------------------"
        echo "---------First Field will be the Primary key feild---------"
        echo "--------------------------------------------------------------------------------------------------"
        while (( $fieldSizes > 0 ));
        do
            read -p "Enter field name: " fieldname
            if [[ $fieldname = [A-Za-z]*([A-Z]|[_-]|[a-z]|[0-9]) ]];
            then
                if ! [[ $(cut -d":" -f 1 $tablename".meta" | grep "$fieldname") ]];
                then
                    PS3="Enter Datatype number: "
                    select choice in "String" "Int"
                    do
                        case $REPLY in
                            1) 
                                echo $fieldname:$choice >> "$tablename"".meta"
                                fieldSizes=$(( fieldSizes - 1))
                                break;;
                            2) 
                                echo $fieldname:$choice >> "$tablename"".meta"
                                fieldSizes=$(( fieldSizes - 1))
                                break;;
                            *)  
                                echo "--------------------------------------"
                                echo "-------------wrong choise-------------"
                                echo "--------------------------------------"
                        esac
                    done
                else
                    echo "----------------------------------------"
                    echo "-----Field name is alredy exist------"
                    echo "----------------------------------------"
                fi
            else
                echo "--------------------------------------------------------------------------------------------------"
                echo "---------The database name must begin with a letter and not contain any special character---------"
                echo "--------------------------------------------------------------------------------------------------"
            fi  
        done
        break
    else
        echo "--------------------------------------------------------------------------------------------------"
        echo "---------Number of Feilds must be integer and between [0-9] ---------"
        echo "--------------------------------------------------------------------------------------------------"
    fi
done
source QueryMenu.sh