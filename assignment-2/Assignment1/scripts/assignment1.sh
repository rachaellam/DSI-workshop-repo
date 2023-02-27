#!/bin/bash

# Saeidehsadat Mirjalili
# Assignment1: Unix & Data

#Part 1
filename=$1
echo "Processing" $filename

#Part 2
#a
tail -n +2 $filename | cut -d, -f4 | sort | uniq

#b
#no code was adopted from internet, but the following webpage was helpful:
# https://www.baeldung.com/linux/csv-parsing 
function get_stats {
	echo "Calculating target statistics..."
	local_min=10000
	local_max=0
	local_sum=0
	local_counter=0
	while read -r line; do
		#update min
		if [ $line -le $local_min ]; then
			local_min=$line
		fi
		#update max
		if [ $local_max -le $line ]; then
			local_max=$line
		fi
		# echo $line
		local_sum=$((local_sum+$line))
		local_counter=$((local_counter+1))
	done < <(tail -n +2 $filename | cut -d, -f5) #tail skips the header line
	echo "mean:" $(($local_sum/$local_counter))
	echo "min:" $local_min
	echo "max:" $local_max
	return
}
get_stats

#c
#selecting the last unique infraction
selected_infraction=$(tail -n +2 $filename | cut -d, -f4 | sort | uniq | tail -n 1)
head -n 1 $filename > filtered_sheet.csv
cat $filename | grep "$selected_infraction" >> ../outputs/filtered_sheet.csv