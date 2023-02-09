#!/bin/bash
while true
read -p "Enter the DataBase name: " dbname
do
    if [[ $dbname = [A-Za-z]*([A-Z]|[_-]|[a-z]|[0-9]) ]];
        then
            if [[ $1 -eq 0 ]]; # 0 for create database
            then
                if ! [[ -e ~/DB/$dbname ]];
                then
                    break
                else
                    echo "----------------------------------------"
                    echo "-----DataBase name is alredy exist------"
                    echo "----------------------------------------"
                fi
            elif [[ $1 -eq 1 ]]; # 1 for connect, and deete database
            then
                if ! [[ -e ~/DB/$dbname ]];
                then
                    echo "----------------------------------------"
                    echo "-------DataBase name is not exist-------"
                    echo "----------------------------------------"
                else
                    break
                fi
            fi
        else
            echo "--------------------------------------------------------------------------------------------------"
            echo "---------The database name must begin with a letter and not contain any special character---------"
            echo "--------------------------------------------------------------------------------------------------"
    fi
done