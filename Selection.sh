#!/bin/bash

while true
read -p "Enter the field name in[$1][$2] : " Fname
do
    if [[ $Fname = [A-Za-z]*([A-Z]|[_-]|[a-z]|[0-9]) ]];
        then
	    FieldNum=`awk -F: -v fname=$Fname '{if($1==fname)print NR}' ~/DB/$1/$2.meta`;
	    FieldType=`awk -F: -v fnum=$FieldNum '{if(NR==fnum)print $2}' ~/DB/$1/$2.meta`;
            if [[ $FieldNum -gt 0 ]];
                then
		    while true
			do
		    	read -p "Enter the [[$Fname]] field value in[$1][$2] : " FieldValue
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
			   
				    
                    awk -F: -v fnum=$FieldNum -v fvalue=$FieldValue '{if($fnum==fvalue)print $0}' ~/DB/$1/$2;
                else
		    echo "----------------------------------------"
                    echo "---------Field name is not exist--------"
                    echo "----------------------------------------"
                    
            fi
	break
        else
            echo "--------------------------------------------------------------------------------------------------"
            echo "---------The field name must begin with a letter and not contain any special character---------"
            echo "--------------------------------------------------------------------------------------------------"
    fi
done
source SelectMenu.sh $1 $2
