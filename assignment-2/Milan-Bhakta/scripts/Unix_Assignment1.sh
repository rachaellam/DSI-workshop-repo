#! /bin/bash

#List of References
#Bash scripting cheatsheet, <https://devhints.io/bash>.
#How to Parse a CSV File in Bash, <https://www.baeldung.com/linux/csv-parsing>.

# Take File CSV as positional Argument 
file=$1

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file>"
    exit 1
fi


# Search for files starting with 'parking' and ending with '.csv'
#found_file=$(find ~/Desktop -type f -iname 'parking*.csv' -print -quit)

#if [ -z "$found_file" ]; then
#    echo "Error: finding parking data file in directory or its subdirectories."
#    exit 1
#fi



# Function to print all types of parking infractions
printAllInfractions() {
    echo "Types of Parking Infractions:"
    cut -d',' -f4 "$file" | tail -n +2 | sort -u
}

#Function to find Mean,Min and Max of Infractions fine amounts
calculateStats(){

    fines=$(cut -d "," -f5 "$file" | sort | tail -n +2) #Get Fines amount only 
    total_fines=$(echo "$fines" | wc -l) # count total numbers of Fines needed for calculations

    #read all lines and Put it in an array for calculations 
    while IFS= read -r rec1
    do
        arr_fines+=("$rec1")
    done <<< "$fines"

    #Initialize variables required for performing calulations and storing values 
    total_sum=0
    mean=0
    min=$total_fines
    max=0

    # Use a for loop to iterate over Fines Array to calculate Sum of all Fines, find MIN & MAX value
    for record in "${arr_fines[@]}"
    do
            if [ ! -z record ]; then
                total_sum=$((total_sum+record))
                if [[ $record -gt 0 && $record -lt $min ]]; then
                    min=$record
                fi
                if [[ $record -gt $max ]]; then
                    max=$record
                fi
            fi
    done

    #Calulate Mean/Average of Total Fines.
    mean=$((total_sum/total_fines))

    # PRINT Mean,MIN,MAX
    echo "Average: $mean"
    echo "Min: $min"
    echo "Max: $max"

}

#Function to Print Infractions,its Fineamounts and addresses in a new csv FILE
saveSelectedInfractionToCsv() {

    #Infraction
    infraction="PARK ON PRIVATE PROPERTY"

    #File to save filtered records into 
    result_file="ParkOnPrivateProperty.csv"

    cut -d "," -f4,5,8 $file | head -1 > "$result_file" && cut -d "," -f4,5,8 $file | grep "$infraction" >> "$result_file"
    mv $result_file ../outputs
}


# Task 1: Print all types of parking infractions
printAllInfractions "$file"

# Task 2: Find Mean, MIN, MAX
calculateStats "$file"

# Task 3: Save Selected Infractions Details to a new File
saveSelectedInfractionToCsv "$file"


