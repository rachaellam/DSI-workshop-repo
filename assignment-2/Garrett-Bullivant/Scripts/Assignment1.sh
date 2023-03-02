#!/bin/bash

# Positional parameter 1 should be parking_data.csv. You must be within the directory which this .csv file exists or explicitly state the entire path.

# code for removing header was found here: https://unix.stackexchange.com/questions/232453/how-to-delete-a-header-without-deleting-other-rows-in-linux
# funct1 prints all unique types of parking infractions (infraction_description)

data=$1

funct1 () {
	cut -d, -f4 $data | tail -n +2 | sort | uniq
}

echo "Below are all of the types of parking infractions in the parking_data.csv dataset:"
funct1 
echo -e "\n"

# code for calculating mean, min, and max was acquired from: https://serverfault.com/questions/239496/using-bash-how-can-i-find-out-the-average-max-and-min-from-a-list-of-numbers
# funct2 caclulates and prints the mean, max, and min for row 5 ("set_fine_amount") of the parking_data.csv file
funct2() {
	cut -d, -f5 $data | grep -v "set_fine_amount" | awk '{if(min==""){min=max=$1}; if($1>max) {max=$1}; if($1<min) {min=$1}; total+=$1; count+=1} END {print total/count, max, min}'
}

echo "mean max min"
funct2

# code for funct3 was adapted from: #https://stackoverflow.com/questions/4428916/bash-how-do-i-choose-rows-from-a-file-that-have-particular-value-in-the-column AND
# https://stackoverflow.com/questions/69726688/how-to-keep-the-header-of-the-file-when-filtering-using-awk

# funct3 first prints the headers and then using an if statement specifies park on private property infractions, and prints a new csv file containing these infractions, with their set fine amount and location2

funct3() {
	head -n 1 $data | cut -d, -f4 -f5 -f8 > private_property_parking_data.csv

	while read -r line ; do
		if [[ $line == *"PARK ON PRIVATE PROPERTY"* ]]; then
			echo $line 
		fi
	done < "$data" | cut -d, -f4 -f5 -f8 >> private_property_parking_data.csv
}
 

funct3

mv private_property_parking_data.csv ../Outputs/



