#!/bin/bash

# PLEASE ENTER APPROPRIATE PATH IN TERMINAL CMD
# path SHOULD POINT TO outputs/topark.csv
# path2 and path3 SHOULD POINT TO outputs/filename1.csv and outputs/filename2.csv
path="$1"
path2="$2"
path3="$3"

# PRINT PARKING INFRACTIONS
# cut command: https://github.com/UofT-DSI/01-intro_shell_git_github/blob/main/slides-resources/unix_slides.md

function printinfract {
    data= cut -d, -f4 <$path | sort | uniq
    echo $data
}
printinfract

# PRINT MINIMUM & MAXIMUM FINES
# SEE COMMENTS RE: PATHS TO ADD TO TERMINAL CMD
# n.b. I was unable to extract the min/max fines data directly from topark.csv so I exported sorted data to new csv files and pulled the min/max figures from there as a janky solution 
# sort options: https://linuxhint.com/bash_sort_command/; sort example: https://stackoverflow.com/questions/6438896/sorting-data-based-on-second-column-of-a-file
# cat command: https://github.com/UofT-DSI/01-intro_shell_git_github/blob/main/slides-resources/unix_slides.md

function printmin {
    sort -t, -k5 -n <$path >$path2
    min= cat <$path2 | cut -d, -f5 | head -n1
    echo $min
}
echo "minimum fine" 
printmin

function printmax {
    sort -t, -k5 -nr <$path >$path3
    max= cat <$path3 | cut -d, -f5 | head -n1 
    echo $max
}
echo "maximum fine"
printmax

# PRINT MEAN (first we need to calculate the sum of column 5, then divide this by the total number of lines/rows ***minus the header row***)
# find mean with awk: https://stackoverflow.com/questions/3122442/how-do-i-calculate-the-mean-of-a-column

function printmean {
    mean= awk -F',' '{sum+=$5} END {print sum/(NR - 1)}' <$path # It has to be (NR- 1) so the header, which has no values, is not included in the count
    echo $mean
}
echo "mean fine"
printmean

# IDENTIFY ALL 'PARK - ON BOULEVARD' INFRACTIONS IN COL4, THEN EXTRACT DATA FROM COLS 4, 5 & 8 TO NEW CSV
# awk + if loop: https://unix.stackexchange.com/questions/527495/how-can-i-search-a-csv-file-for-a-value-then-get-another-value-associated-with
# awk + extract to csv: https://stackoverflow.com/questions/7857090/extract-specific-columns-from-delimited-file-using-awk

data= awk -F',' '{ if ($4 == "PARK - ON BOULEVARD") { print $4 "," $5 "," $8} }' <$path >./outputs/infraction.csv #change to path on your local machine