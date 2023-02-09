#!/bin/bash

# while true
# read -p "Enter the Table name [$1] : " Tname
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
source SelectMenu.sh $1 $tablename
