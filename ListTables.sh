#!/bin/bash
# shopt -s extglob
echo "-----------------------------------------------------"
echo "-------------All Tables In [$1] database-------------"
ls -I "*.meta" #list all thing except the match pattern
echo "-----------------------------------------------------"
source QueryMenu.sh
