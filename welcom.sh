#!/bin/bash
echo "----------------------------------------------------------------------"
echo "------------------------- Welcom to our DBMS -------------------------"
echo "----------------------------------------------------------------------"
PS3="Enter your choice number: "
select choice in "Enter to DBMS system" "Exit";
do
    case $REPLY in
        1) 
            if ! [[ -e ~/DB ]];
            then
                mkdir ~/DB
            fi
            cd ~/DB
	    echo "--------------------------------------"
            source DBMenu.sh
            break
            ;;
        2) 
            break;;
        *) 
            echo "--------------------------------------"
            echo "-------------wrong choice-------------"
            echo "--------------------------------------";;
    esac
done

















