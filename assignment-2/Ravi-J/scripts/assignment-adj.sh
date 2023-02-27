#!/bin/bash


INPUT=$1 #input file
OUTPUT=$2 #output file

# print all types of parking infractions (https://www.baeldung.com/linux/csv-parsing)

function funct {
  cut -d, -f4 < $INPUT
  return
}
funct
echo

# prints min and max amount from set-fine-amount (f5) column (https://unix.stackexchange.com/questions/558270/how-to-get-max-min-and-mean-from-values-in-column-4)

#1 setting conditions for min, max value for column f5

awk -F, 'NR>1 { min = $5; max = $5 }        
{
    if ($5 > max) {
        max = $5
    }
    if ($5 < min) {
        min = $5
    }
} END {
    print max
    print min

}' $INPUT


# extract designated columns, search for "Park on Private Property" and extract to OUTPUT

function funct {
  cut -d, -f4 -f5 -f8 -f11 < $INPUT | sort | uniq | grep "PARK ON PRIVATE PROPERTY" > $OUTPUT
  return
}

funct

#  create temporary header file (header.csv), merge OUTPUT into header.csv, rename header.csv to OUPUT file (https://fedingo.com/how-to-add-header-in-csv-file-using-shell-script/)

echo infraction_description,set_fine_amount,location2,province > header.csv && cat $2 >> header.csv && mv header.csv $2



