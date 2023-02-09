#!/bin/bash
echo
PS3="Enter query operation number [$1] : "
select choice in "Create-Table" "Drop-Table" "Insert-Into-Table" "List-Tables" "Select-From-Table" "Delete-From-Table" "Update-Table" "Exit";
do
    case $REPLY in
        1) 
            source CreateTable.sh $1
	        break;;
        2) 
            source DropTable.sh $1
            break;;
        3) 
            source InsertIntoTable.sh $1
            break;;
        4) 
            source ListTables.sh $1
            break;;
        5) 
            source SelectFromTable.sh $1
            break;;
        6)
            source Delete.sh $1
            break;;
        7)
            source updateTable.sh $1
            break;;
        8)
            echo "--------------------------------------"
            cd ~/DB
            source DBMenu.sh
            break;;
            *) 
                echo "--------------------------------------"
                echo "-------------wrong choise-------------"
                echo "--------------------------------------"
    esac
done
