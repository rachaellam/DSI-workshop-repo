# Zihan Gao (Ellis) - Assignment 1
#!/bin/bash

# citations
    # https://open.toronto.ca/dataset/parking-tickets/ - the source of data
    # https://www.baeldung.com/linux/csv-parsing
    # https://ryanstutorials.net/bash-scripting-tutorial/bash-arithmetic.php
    # https://www.shell-tips.com/bash/math-arithmetic-calculation/#gsc.tab=0 


function q2a() {
    # create temporary file for infraction descriptions
    echo -n "" > infraction_description.txt

    # read all lines of input file and store in infraction_description.txt
    while IFS="," read -r tag_number_masked date_of_infraction infraction_code infraction_description set_fine_amount time_of_infraction location1 location2 location3 location4 province
    do
        echo $infraction_description >> infraction_description.txt
    done < <(tail -n +2 $1)

    # sort, remove duplicate, and print infraction descriptions
    sort -u infraction_description.txt
}

function q2b() {
    # create variables
    let min_fine=-1
    let max_fine=-1
    let fine_count=0
    let fine_sum=0

    # read all lines of input file and store in infraction_description.txt
    while IFS="," read -r tag_number_masked date_of_infraction infraction_code infraction_description set_fine_amount time_of_infraction location1 location2 location3 location4 province
    do

        # find min fine
        if ((fine_count==0 || set_fine_amount<min_fine)); then
            min_fine=$((set_fine_amount)) 
        fi
        # find max fine
        if ((fine_count==0 || set_fine_amount>max_fine)); then
            max_fine=$((set_fine_amount)) 
        fi
        fine_count=$((fine_count+1)) 

        # Calculate mean fine
        fine_sum=$((fine_sum+set_fine_amount))
    done < <(tail -n +2 $1)

    # show the corresponding values
    echo "fine sum = " $fine_sum
    echo "fine count = " $fine_count
    echo "min fine = " $min_fine
    echo "max fine = " $max_fine
    echo "mean fine = " $((fine_sum/fine_count))
}

function q2c() {
    # create temporary file for output
    echo -n "" > output_file.txt

    # output the headers
    head -n 1 $1 > output_file.txt

    # separating by the fields
    while IFS="," read -r tag_number_masked date_of_infraction infraction_code infraction_description set_fine_amount time_of_infraction location1 location2 location3 location4 province
    do
        if [[ "$infraction_description" == "$2" && "$set_fine_amount" == "$3" && "$location2" == "$4" ]]; then
            echo $tag_number_masked,$date_of_infraction,$infraction_code,$infraction_description,$set_fine_amount,$time_of_infraction,$location1,$location2,$location3,$location4,$province >> output_file.txt
        fi
    done < <(tail -n +2 $1)
}

# run the function
q2a $1
q2b $1
q2c $1 "$2" "$3" "$4"
# $1 is the input csv, $2 is infraction description, $3 is set_fine_amount, $4 is location2
# example of how you run the program: ./Assignment1.sh Parking_Data.csv "PARK ON PRIVATE PROPERTY" "30" "4700 JANE ST"