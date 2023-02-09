#!/bin/bash
while true
read -p "Enter the Table name: " tablename
do
    if [[ $dbname = [A-Za-z]*([A-Z]|[_-]|[a-z]|[0-9]) ]];
        then
            if [[ $1 -eq 0 ]]; # 0 for create table
            then
                if ! [[ -e ~/DB/$dbname/$tablename ]];
                then
                    break
                else
                    echo "----------------------------------------"
                    echo "-----Table name is alredy exist------"
                    echo "----------------------------------------"
                fi
            elif [[ $1 -eq 1 ]]; # for all
            then
                if ! [[ -e ~/DB/$dbname/$tablename ]];
                then
                    echo "----------------------------------------"
                    echo "-------Table name is not exist-------"
                    echo "----------------------------------------"
                else
                    break
                fi
            fi
        else
            echo "--------------------------------------------------------------------------------------------------"
            echo "---------The Table name must begin with a letter and not contain any special character---------"
            echo "--------------------------------------------------------------------------------------------------"
    fi
done