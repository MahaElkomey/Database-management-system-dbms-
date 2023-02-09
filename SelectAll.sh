#!/bin/bash
echo "-------------All data In [$1][$2] table-------------"
cat ~/DB/$1/$2 #read all data in table
echo "-----------------------------------------------------"
source SelectMenu.sh $1 $2
