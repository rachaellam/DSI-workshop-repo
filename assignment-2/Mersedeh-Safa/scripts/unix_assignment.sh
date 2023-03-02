#!/bin/bash


foo=$1 #global variable

assignment () {

     cut -d, -f4 <$foo | sort | uniq -c | sort -nr #assignment part a


     cut -d, -f5 <$foo | sort -n | { #assignment part b - reference: https://stackoverflow.com/questions/29783990/awk-find-minimum-and-maximum-in-column under a non-awk answer
          read line
          echo "min=$line"
          while read line; do max=$line; done
          echo "max=$max"
     }

     echo "infraction_description","set_fine_amount","location2" > header.csv #assignment part c - reference: https://stackoverflow.com/questions/58434858/header-for-a-csv-file-from-unix-shell-script
     cut -d, -f4 -f5 -f8 <$foo | grep "STAND IN ACCESSIBLE NO PERMIT" >> outputs/header.csv
     mv outputs/header.csv outputs/new.csv
}

assignment
echo "Finished"