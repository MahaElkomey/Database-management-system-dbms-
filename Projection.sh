#!/bin/bash
FieldArr=""
while true
    read -p "Enter the number of field you want to select it : " Fcount;
    do
        if [[ $Fcount = [0-9] ]]
        then
            break
        fi
    done

while true
read -p "Enter the field name in[$1][$2] : " Fname;
do
    if [[ $Fname = [A-Za-z]*([A-Z]|[_-]|[a-z]|[0-9]) ]];
        then
	    FieldNum=`awk -F: -v fname=$Fname '{if($1==fname)print NR}' ~/DB/$1/$2.meta`;
            if [[ $FieldNum -gt 0 ]];
            then
                if [ $Fcount -eq 1 ]
                then
                    FieldArr=$FieldArr$FieldNum;
                else
                    FieldArr=$FieldArr$FieldNum",";
                fi
		        Fcount=$(( Fcount - 1));
            else
		        echo "----------------------------------------"
                echo "---------Field name is not exist--------"
                echo "----------------------------------------"   
            fi
    else
            echo "--------------------------------------------------------------------------------------------------"
            echo "---------The field name must begin with a letter and not contain any special character---------"
            echo "--------------------------------------------------------------------------------------------------"
    fi
if [ $Fcount -lt 1 ]
then
   break
fi
done
#echo $FieldArr
cut -d: -f $FieldArr ~/DB/$1/$2;
source SelectMenu.sh $1 $2
