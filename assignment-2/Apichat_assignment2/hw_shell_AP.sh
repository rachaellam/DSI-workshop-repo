#!/bin/bash

# Homework Shell

# Echo test-{A,B,C}-Example
# touch "Two words.txt" 

# ls -l "Two words.txt"
# mv "two_words.txt" Two_words.txt

# mkdir dir-{1..5}

# cut -d, -f1 -f2 < covid19_cases.csv | sort | uniq | tail -n 15
# git add -A 

# cat README.md

# git commit

# git commit -a -m "the message"

# function funct { 
# 	echo "Step 2"
# 	return 
# }

# #Program starts here

# echo "Step 1"
# function
# echo "Step 3"

# foo="something cool"
# echo $foo

# foo=0 # global variable foo 
# funct_1 () {
# 	foo=1
# 	echo "funct_1: foo = $foo"
# }

# funct_2 () {
# 	foo=2
# 	echo "funct_2: foo = $foo"
# }

# echo "global: foo = $foo"
# funct_1
# echo "global: foo = $foo"
# funct_2
# echo "global: foo = $foo"

# filename="myfileEx"
# touch $filename
# mv $filename ${filename}1

# foo=
# echo ${foo:="Something else"}
# echo $foo
# foo=Valentine
# echo ${foo:="Something else"}
# echo $foo

# foo=Love
# echo ${foo:?"Something else"}
# echo $foo
# foo=Valentine
# echo ${foo:?"Something else"}
# echo $foo

# foo=
# echo ${foo:+"Something else"}
# echo $foo
# foo=Valentine
# echo ${foo:+"Something else"}
# echo $foo

# foo="Toronto needs more trees"
# echo "'$foo' is ${#foo} charactors long"
# echo ${foo:8}
# echo ${foo:8:5}

# foo=/user/name/desktop/file.txt.zip
# echo ${foo#/*/}
# Result > name/desktop/file.txt.zip
# echo ${foo##/*/}
# Result > file.txt.zip

# foo="MP3.MP3"
# echo ${foo/MP3/mp3}
# Result > mp3.MP3

# echo ${foo//MP3/mp3}
# Result > mp3.mp3

# echo ${foo/#MP3/mp3}
# Result > mp3.MP3

# echo ${foo/%MP3/mp3}
# Result > MP3.mp3

# foo="AP cool file"
# echo ${foo/AP cool file/AP COOL FILE}
# echo ${foo/AP cool file/AP_COOL_FILE}

# foo=1 
# echo $((foo++))
# echo $foo
# Result 
# 1
# 2

# echo $((++foo))
# echo $foo
# Result
# 2
# 2

# echo $((++foo++))
# echo $foo
# Result
# error
# 2

# x=$(find t*)
# echo $x | sort
# result > test.txt

# x=5 

# if [ $x=5 ]; then 
# 	echo "x equals 5"

# else
# 	echo "x does not equal 5"

# fi

# result > x equals 5

# cd ~/desktop/dir1

# if [[ -n $(find t* | grep " ") ]]; then
# 	echo "A file contains a space"
# else 
# 	echo "No files contain a space" 

# fi

# filename=$1
# word1=$2
# word2=$3

# if grep $word1 $filename || grep $word2 $filename; then 
# 	echo "$word1 and $word2 are both in $filename."
# fi

# Script called while-count.sh

# count=1

# while [ $count -le 10 ]; do 
# 	echo $count
# 	count=$((count +1))
# done
# echo "Finished."

# file=file

# while read -r line; do 
# 	if [[ $line == *"bananas"* ]]; then 
# 	echo $line
# fi
# done < "$file"

# count=1

# until [ $count -gt 10 ]; do 
# 	echo $count
# 	count=$((count +1))
# done
# echo "Finished."

# x=1
# until [[ $x == 6 ]]; do 
# 	echo "Creating dir$x..."
# 	mkdir dir$x
# 	((x++))
# done

# for i in $(find *); do 
# 	echo $i
# done
# same as "ls"

# test-file: Evaluate the status of a file

# test_file () {
# File=~/.bashrc

# if [ -e "$FILE" ]; then 
# 	if [ -f "$FILE" ]; then 
# 		echo "$FILE is a regular file."
# 	fi
# 	if [ -d "$FILE" ]; then 
# 		echo "$FILE is a directory."
# 	fi 
# else
# 	echo "$FILE does not exist."
# 	exit 1 
# fi
# }

# Rename from Parking_Tags_Data_2020.001.csv to Parking_data_HW.csv
# mv Parking_Tags_Data_2020.001.csv Parking_data_HW.csv

# File=Parking_data_HW.csv
# echo $infraction_description

# max=4
# cat parking_data_hw.csv | while read LINE 
# do
# 	fir='echo $LINE | awk ' {print $2} '
# 	sec='echo $LINE | awk ' {print $3} '
# 	if [ $fir -gt $max ]; then 
# 	max=$fir
# 	fi

# 	if [ $sec -gt $max ]; then 
# 	max=$sec 
# 	fi
# done
# grep $max parking_data_hw.txt

# for the Assignment 1 
# Choose the 5th column of the parking_data_hw.csv 
# cut -f5 -d"," parking_data_hw.csv 
# The result showed the 5th column (set_fine_amount) without any sort.

# cut -f5 -d"," parking_data_hw.csv | sort
# The result showed the 5th column (set_fine_amount) from lowest to highest fine amount.

# cut -f5 -d"," parking_data_hw.csv | sort -n | head -1
#The minimal fine amount is 0 

# cut -f5 -d"," parking_data_hw.csv | sort -n | tail -1
#The maximum fine amount is 450 

# Ref https://stackoverflow.com/questions/16212410/finding-the-max-and-min-values-and-printing-the-line-from-a-file

# awk "{print $4,$5,$8}" Parking_data_HW.csv > Assignment1_2c.csv



# Choose the 4th row that contain "PARK-N.YORK 2AM-6AM DEC1-MAR31" and create the new file named "Assignment1_2c_Beta.csv"
awk -F, -v OFS=, '$4=="PARK-N.YORK 2AM-6AM DEC1-MAR31"' Parking_data_HW.csv > AP_Assignment1_2c_Beta.csv

# Then cut the column 4,5, and 8 to a new csv file named "AP_Assignment1_2c.csv"
cut -d, -f4,5,8 AP_Assignment1_2c_Beta.csv > AP_Assignment1_2c.csv
# Ref https://www.unix.com/shell-programming-and-scripting/260065-extract-multiple-columns-base-double-quotes-delimiter.html 
