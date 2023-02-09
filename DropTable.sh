#!/bin/bash
# while true
# read -p "Enter the Table name: " Tname
# do
#     if [[ $Tname = [A-Za-z]*([A-Z]|[_-]|[a-z]|[0-9]) ]];
#         then
#             if ! [[ -e ~/DB/$1/$Tname ]];
#                 then
#                     echo "----------------------------------------"
#                     echo "-------Table name is not exist-------"
#                     echo "----------------------------------------"
#                 else
#                     break
#             fi
#         else
#             echo "--------------------------------------------------------------------------------------------------"
#             echo "---------The Table name must begin with a letter and not contain any special character---------"
#             echo "--------------------------------------------------------------------------------------------------"
#     fi
# done

source TableValidation.sh 1
rm ~/DB/$1/$tablename
rm ~/DB/$1/$tablename.meta
echo "----------------------------------------"
echo "------Table $tablename is removed-------"
echo "----------------------------------------"
source QueryMenu.sh
