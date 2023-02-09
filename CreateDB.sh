#!/bin/bash
# while true
# read -p "Enter the DataBase name: " dbname
# do
#     if [[ $dbname = [A-Za-z]*([A-Z]|[_-]|[a-z]|[0-9]) ]];
#         then
#             if ! [[ -e ~/DB/$dbname ]];
#                 then
#                     break
#                 else
#                     echo "----------------------------------------"
#                     echo "-----DataBase name is alredy exist------"
#                     echo "----------------------------------------"
#             fi
#         else
#             echo "--------------------------------------------------------------------------------------------------"
#             echo "---------The database name must begin with a letter and not contain any special character---------"
#             echo "--------------------------------------------------------------------------------------------------"
#     fi
# done
source DatabaseValidation.sh 0
mkdir ~/DB/$dbname
echo "----------------------------------------"
echo "-------DataBase $dbname is Added--------"
echo "----------------------------------------"
#cd ~/DB/$dbname
source DBMenu.sh

