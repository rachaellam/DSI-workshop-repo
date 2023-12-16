#line 2 says that the script is written in bash
#!/bin/bash

#line 5 takes 1st positional parameter and stores it as variable 'file'
file=$1

#defining finction'infraction' which extracts uniq types of infractions from column 4 and sorts them.
#tail filter starts data from 2nd line, removing header.
infraction() {
	cut -d, -f4 < $file | tail -n +2 | sort | uniq 
}

#defining function for getting a list of fine
# NR > 1 will remove 1st line/ $5 will print 5th column/ and everything will be sorted numerically
# reference-1: https://stackoverflow.com/questions/15856733/what-is-the-easiest-way-to-remove-1st-and-last-line-from-file-with-awk
# I referred above link to understand how to remove header line while using 'awk' to extract column
fine() {
	awk -F ',' 'NR > 1 {print $5}' "$file" | sort -t ',' -n
}

#storing list of fine in a array variable'finelist'
# reference-2: https://serverfault.com/questions/519874/shell-script-reading-a-column-from-file-store-it-in-array
# I reffered above link to understand how to store column value as an array
finelist=($(fine))

#running for loop to find maximum value from array variable
maxnumber=-1

for i in "${finelist[@]}"; do
	if ((i > maxnumber)); then
		maxnumber=$i
	fi
done

#running for loop to find minimum value from array variable
minnumber=1000

for i in "${finelist[@]}"; do
	if ((i <minnumber)); then
		minnumber=$i
	fi
done

#running for loop get sum of the all the values in array
sum=0

for i in "${finelist[@]}"; do
	sum=$((sum + i))
done

#getting total number of values( or entries) in array
count="${#finelist[@]}"

#getting average
average=$(($sum/$count))

#calling function infraction for 1st positional parameter. i.e. file of interest in current directory
# answer to part(a) is below:
echo "Types of infractions"
infraction $file
echo ""
# answer to part(b) is below:
echo "Maximum fine is: $ $maxnumber"
echo "Minimum fine is: $ $minnumber"
echo "Average fine is: $ $average"
echo ""
#answer to part(c) is below:
echo "creating new file as 'park_in_a_fire_route.csv' in working directory. this contain information regarding only 'park in a fire' type of infraction"
cut -d, -f4,5,8 $file | { head -n 1; grep "PARK IN A FIRE ROUTE"; } > park_in_a_fire_route.csv


