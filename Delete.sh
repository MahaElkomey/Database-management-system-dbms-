#!/bin/bash
PS3="Enter Delete type number: "
while true
read -p "Enter the Table name: " tablename
do
    if [[ $tablename = [A-Za-z]*([A-Z]|[_-]|[a-z]|[0-9]) ]];
        then
            if ! [[ -e ~/DB/$1/$tablename ]];
            then
                echo "----------------------------------------"
                echo "-------Table name is not exist-------"
                echo "----------------------------------------"
            else
                break
            fi
        else
            echo "--------------------------------------------------------------------------------------------------"
            echo "---------The Table name must begin with a letter and not contain any special character---------"
            echo "--------------------------------------------------------------------------------------------------"
    fi
done

before=$(wc -l < ~/DB/$1/$tablename)
select choice in "Delete ALL Records" "Delete Specific Records"
do
    case $REPLY in
        1) 
            > ~/DB/$1/$tablename
            break;;
        2) while true
            do
                read -p "Enter field name you want to delete with: " fieldname
                if [[ $fieldname = [A-Za-z]*([A-Z]|[_-]|[a-z]|[0-9]) ]];
                then
                    if [[ $(cut -d":" -f 1 $tablename".meta" | grep "$fieldname") ]];
                    then
                        read -p "Enter the data which in [$fieldname] field: " data
                        fieldnum=$( awk -F: -v fieldname=$fieldname '{if($1==fieldname)print NR}' ~/DB/$1/$tablename.meta )
                        
                        touch ~/DB/$1/temp
                        awk -F: -v data=$data fieldnum=$fieldnum'{if($fieldnum!=data)print $0}' ~/DB/$1/$tablename > ~/DB/$1/temp
                        cat ~/DB/$1/temp > ~/DB/$1/$tablename
                        rm -f ~/DB/$1/temp
                        break
                    else
                        echo "----------------------------------------"
                        echo "-----Field name is not exist------"
                        echo "----------------------------------------"
                    fi
                else
                    echo "--------------------------------------------------------------------------------------------------"
                    echo "---------The database name must begin with a letter and not contain any special character---------"
                    echo "--------------------------------------------------------------------------------------------------"
                fi
            done
            break;;
            *)  
                echo "--------------------------------------"
                echo "-------------wrong choise-------------"
                echo "--------------------------------------"
    esac
done
after=$(wc -l < ~/DB/$1/$tablename)
echo "--------------------------------------------------------------------------------------------------"
echo "---------------------------------------"$(( $before - $after )) record is deleted"----------------------------------------"
echo "--------------------------------------------------------------------------------------------------" 
source QueryMenu.sh