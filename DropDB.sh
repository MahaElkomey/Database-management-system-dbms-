#!/bin/bash
# while true
# read -p "Enter the DataBase name: " dbname
# do
#     if [[ $dbname = [A-Za-z]*([A-Z]|[_-]|[a-z]|[0-9]) ]];
#         then
#             if ! [[ -e ~/DB/$dbname ]];
#                 then
#                     echo "----------------------------------------"
#                     echo "-------DataBase name is not exist-------"
#                     echo "----------------------------------------"
#                 else
#                     break
#             fi
#         else
#             echo "--------------------------------------------------------------------------------------------------"
#             echo "---------The database name must begin with a letter and not contain any special character---------"
#             echo "--------------------------------------------------------------------------------------------------"
#     fi
# done
source DatabaseValidation.sh 1
rm -r ~/DB/$dbname
echo "----------------------------------------"
echo "------DataBase $dbname is removed-------"
echo "----------------------------------------"
source DBMenu.sh
