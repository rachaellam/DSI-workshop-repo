#Shell Script
#!/bin/bash

#this is my first comment 
#Anything after # is a comment 

#echo "This is my first script!!"

#function name {
#	commands
# 	return
# }

#name () {
# 	commands
# 	return
# }

# function funct {
# 	echo "Step 2"
# 	return
# }

# echo "Step 1"
# funct
# echo "Step 3"

# foo=0 #global variable

# funct_1 () {
# 	local foo #local variable to funct_1
# 	foo=1
# 	echo "funct_1: foo = $foo" 
# }

# funct_2 () {
# 	local foo 
# 	foo=2 
# 	echo "funct_2: foo = $foo"
# }

# echo "global: foo = $foo"
# funct_1
# echo "global: foo = $foo"
# funct_2
# echo "global: foo = $foo"

# The result will be 
# (base) APs-MBP:workshop apichatphoti-a$ ./First-Script.sh
# global: foo = 0
# funct_1: foo = 1
# global: foo = 0
# funct_2: foo = 2
# global: foo = 0
# (base) APs-MBP:workshop apichatphoti-a$ 

# foo=0 #global variable

# funct_1 () {
# 	#local foo #local variable to funct_1
# 	foo=1
# 	echo "funct_1: foo = $foo" 
# }

# funct_2 () {
# 	local foo 
# 	foo=2 
# 	echo "funct_2: foo = $foo"
# }

# echo "global: foo = $foo"
# funct_1
# echo "global: foo = $foo"
# funct_2
# echo "global: foo = $foo"

# If we put # in line 60 before local, the result will be 
# (base) APs-MBP:workshop apichatphoti-a$ ./First-Script.sh
# global: foo = 0
# funct_1: foo = 1
# global: foo = 1
# funct_2: foo = 2
# global: foo = 1

# foo=0 #global variable

# funct_1 () {
# 	#local foo #local variable to funct_1
# 	foo=1
# 	echo "funct_1: foo = $foo" 
# }

# funct_2 () {
# 	#local foo 
# 	foo=2 
# 	echo "funct_2: foo = $foo"
# }

# echo "global: foo = $foo"
# funct_1
# echo "global: foo = $foo"
# funct_2
# echo "global: foo = $foo"

# If we put # in line 88 and 94 before local, the result will be 
# (base) APs-MBP:workshop apichatphoti-a$ ./First-Script.sh
# global: foo = 0
# funct_1: foo = 1
# global: foo = 1
# funct_2: foo = 2
# global: foo = 2

# foo="Apichat"
# foo="~/Desktop/workshop/parking_data.csv"

# cut -d, -f4 < $foo | sort | uniq -c | sort -nr

# echo "
# Number of argument: $#
# \$0 = $0
# \$1 = $1
# \$2 = $2
# \$3 = $3
# "

# The result will be 
# Number of argument: 0
# $0 = ./First-Script.sh
# $1 = 
# $2 = 
# $3 = 

# Then add ./First-Script.sh a 10 "my name is Apichat"
# The result will be

# Number of argument: 3
# $0 = ./First-Script.sh
# $1 = a
# $2 = 10
# $3 = my name is Apichat

# function afunc {
# 	echo in function: $0 $1 $2 
# 	var1="in function"
# 	echo var1: $var1
# }

# var1="outside function"

# echo var1: $var1
# echo $0 $1 $2
# afunc funcarg1 funcarg2
# echo var1: $var1
# echo $0 $1 $2

# if condition; then 
# 	commands 
# [elseif condition; then #don't need this line 
# 	commands]
# [else #don't need this line 
# 	commands]
# fi

# if [ $x = 5 ]; then 
# 	echo "x equals 5"
# else 
# 	echo "x doesnot  equal 5"
# fi

# cd ~/Desktop/workshop

# if [[ -n $(find t* | grep " ")n ]]; then 
# 	echo "A file contains space"
# else 
# 	echo "No files contain a space"
# fi

# Syntax for while
# while condition; do 
# 	commands 
# done

# count=1

# while [ $count -le 5 ]; do #le means leass than or equal
# 	echo $count
# 	count=$((count +1))
# done
# echo "Finished."

file=$1

# file=~/Desktop/workshop/frog.txt

# create the loops
# while read -r line; do
# 	echo $line
# 	done < "$file" #pass the $file into a read file using while

# file=$1

# while read -r line; do
# 	if [[ $line == *"Apichat"* ]]; then 
# 	echo $line
# 	fi
# done < "$file"

# for loops 

# for i in $(find *); do 
# 	echo $i 
# done

for i in $(find *); do 
#	for x in $i #cant use for i in $i 
	for line in $file
		for letter in $line
done
