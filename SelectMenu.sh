echo
PS3="Enter query operation number [$1][$2] : "
select choice in "Select-All" "Selection" "Projection" "Exit";
do
    case $REPLY in
        1) 
            source SelectAll.sh $1 $tablename
	    break;;
        2) 
            source Selection.sh $1 $tablename
            break;;
        3) 
            source Projection.sh $1 $tablename
            break;;
        4)
            echo "--------------------------------------"
            cd ~/DB/$1
            source QueryMenu.sh
            break;;
            *) 
                echo "--------------------------------------"
                echo "-------------wrong choise-------------"
                echo "--------------------------------------"
    esac
done
