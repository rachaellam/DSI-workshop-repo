#!/bin/bash

#Script taking the parking data as a positional parameter

cd ~/Desktop

file=$1  # Note - Save script to Desktop and in the terminal enter "./DSF_assignment1.sh parking_data.csv" to assigin the csv file to $1

# Build a function that prints infraction_description

x=$(cut -d, -f4 $file)

infractions () {
	echo $x
	return
}

infractions


# Build functions that find and print the min and max set_fine_amounts.
# Online reference: https://stackoverflow.com/questions/16212410/finding-the-max-and-min-values-and-printing-the-line-from-a-file


y=$(cut -d, -f5 $file |sort -n |head -1) #min
z=$(cut -d, -f5 $file |sort -n |tail -1) #max


min_fine-amt () {
  echo "Minimum set fine amount:$y"
  return
}

max_fine_amt () {
  echo "Maximum set fine amount:$z"
  return
} 

min_fine-amt
max_fine_amt


#Build a function that saves one type of parking infraction "PARK IN A FIRE ROUTE". For this infraction type print the following fields:infraction_description, set_fine_amount, location2 to a separate CSV file
#Online reference 1 : https://unix.stackexchange.com/questions/722178/how-do-i-print-lines-in-awk-where-one-column-matches-a-value
#Online reference 2 : https://stackoverflow.com/questions/66220062/how-to-add-a-header-to-awk-output 


awk -F',' 'NR==1 {print "infraction_description","\t", "set_fine_amount", "\t", "location2"} {if ($4 == "PARK IN A FIRE ROUTE") {print $4,"\t", $5,"\t", $8} else {next}}' $file > Assignment1_extract1.csv


