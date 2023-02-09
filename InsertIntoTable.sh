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

#insertion section 

source TableValidation.sh 1
FieldName=`cut -d":" -f1 ~/DB/$1/$tablename.meta`;
i=0;
for field in $FieldName;
do

	FieldType=`awk -F: -v fname=$field '{if($1==fname)print $2}' ~/DB/$1/$tablename.meta`;
	if [ $i -eq 0 ] #check the primary key should be unique
	then
		while true
		do
		    read -p "Insert the primary key [[$field]] value in[$1][$tablename] : " FieldValue
			if [ $FieldType = "Int" ];
			then
				if ! [[ $FieldValue =  +([0-9]) ]];
				then
					echo "----------------------------------------"
					echo "---------the value should be int--------"
					echo "----------------------------------------"
					continue;	
				fi
			fi

			if [[ $(cut -d":" -f 1 $tablename | grep "$FieldValue") ]];
                    	then
				echo "---------------------------------------------"
				echo "---------primary key should be unique--------"
				echo "---------------------------------------------" 
			else
				break
			fi
		done
	InsertRow=$FieldValue;
	else #insert any other value withen DB constrain (Int or String) 
		while true
			do
		    	read -p "Insert the [[$field]] field value in[$1][$tablename] : " FieldValue
		    	if [ $FieldType = "Int" ];
			then
				if [[ $FieldValue =  +([0-9]) ]];
				then
					break
				else
					echo "----------------------------------------"
					echo "---------the value should be int--------"
					echo "----------------------------------------"
				fi
			else
				break
			fi
		done
	InsertRow=$InsertRow":"$FieldValue;
	fi
 
i=$(( i + 1));
done
echo $InsertRow >> $tablename;
echo "----------------------------------------------------"
echo "---------------"1 record is inserted"----------------"
echo "----------------------------------------------------" 
source QueryMenu.sh

