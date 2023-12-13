#!/bin/bash

###########################################################################
# Shellscript:	DSI_Assignment1.sh - the script receives a Parking Tickets 
#               dataset csv file from the City of Toronto Open Data Catalogue 
#               (https://open.toronto.ca/dataset/parking-tickets/). 
#               
#               And:
#                 1. Gets all the different infraction codes.
#                 2. Calculates the mean and median of the values on the 
#                    infraction_description column.
#                 3. Extracts all rows containing the description on the 
#                    infraction_code column and exports the data into a
#                    file.
#
# Author     :	German Silva (german@e4oss.ca)
# Date       :	12-05-23
# Category   :	DSI - Assignment 1 - Unix and Data
version="1.0"
###########################################################################
# Change Control:
#
# Changes
# 
###########################################################################

###########################################################################
# Parameters
###########################################################################
infractionCode="PARK PROHIBITED TIME NO PERMIT"
extractDataFile="park_prohibited_time_no_permit_data.csv"

###########################################################################
# WARNING - DO NOT MODIFY ANY CODE AFTER THIS LINE
###########################################################################

###########################################################################
# global Variables
###########################################################################
filename=$1

#--------------------------------------------------------------------------
# Function   : getInfractionTypes
# Description: prints all infraction Types based on the infraction_description column
# Arguments  : filename
# Output     : all infraction Type
# Returns    : None
#
# Note       : this function is terribly ineficient the same result can be acieved by using:
#              cut -d, -f4 < $dataFile | sort | uniq | grep -v "infraction_description"
#              time reports to take:
#              real	0m0.394s
#              user	0m0.384s
#              sys	0m0.050s
#--------------------------------------------------------------------------

function getInfractionTypes {
    local dataFile=$1
    local infraction_description
    declare -A infraction_description_codes

    local num_rows=$(wc -l < "$dataFile") # get the number of lines to process
    ((num_rows-=1))    # substract the header line

    local rows_counter=0

    print_separator "List of infraction Types"
    echo "Loading Data from File"
    while read -r line
    do
        # Remove Carriage return as explained here
        # https://stackoverflow.com/questions/15520339/how-to-remove-carriage-return-from-a-variable-in-shell-script
        line=${line//$'\r'}                                
                                                           
        if [[ ! $line =~ 'infraction_description' ]]; then # Check if the line does not contain the columns header

          infraction_description=($(echo $line | awk -F, '{print $4}' | tr ' ' '_')) # gets the infraction description

          # Adds the infraction description as keys in an associative array:
          # https://stackoverflow.com/questions/13648410/how-can-i-get-unique-values-from-an-array-in-bash

          infraction_description_codes[`echo "${infraction_description}" | tr '_' ' '`]="" 

          ((rows_counter+=1)) #increment rows counter

          ProgressBar $rows_counter $num_rows
        
        fi
    done < $dataFile

    echo ""
    echo ""
    for sidc in "${!infraction_description_codes[@]}"; do
      echo "${sidc}"
    done
}


#--------------------------------------------------------------------------
# Function   : getStats
# Description: Gets the mean, min and max values of the set_fine_amount column
# Arguments  : filename
# Output     : Shows the mean, min and max values of the set_fine_amount column
# Returns    : None
#--------------------------------------------------------------------------

function getStats {
    local dataFile=$1
    local rows_counter=0 sum=0 min=0 max=0 fine_amount=0 mean=0

    local num_rows=$(wc -l < "$dataFile") # get the number of lines to process
    ((num_rows-=1)) # substract the header line

    print_separator "Get Statistics"
    echo "Loading Data from File"
    
    while read -r line
    do  
        # Remove Carriage return as explained here
        # https://stackoverflow.com/questions/15520339/how-to-remove-carriage-return-from-a-variable-in-shell-script
        line=${line//$'\r'}                                
                                                           
        if [[ ! $line =~ 'tag_number_masked' ]]; then      # Check if the line does not contain the columns header

          fine_amount=$(echo $line | awk -F, '{print $5}') # gets the data from the fifth column

          if (( $rows_counter == 0 )); then                    # if it is the first data row
            min=$(($fine_amount))                          # set min and max to fine_amount
            max=$(($fine_amount))
          fi

          sum=$(($sum + $fine_amount))                     # Add to the total        

          if (( $fine_amount < $min )); then               # Check if current value is the minimum
            min=$(($fine_amount))
          fi

          if (( $fine_amount > $max )); then               # check if the current value is the maximum
            max=$(($fine_amount))
          fi

          rows_counter=$(($rows_counter + 1))                      # increment row counter
        fi

        ProgressBar $rows_counter $num_rows

    done < $dataFile
    
    mean=$(($sum / $rows_counter))                             # calculate the average value

    echo ""
    echo ""
    echo "statistics from $dataFile data:"
    echo "The mean value is   : $mean"
    echo "The minimum value is: $min"
    echo "The maximum value is: $max"
}

#--------------------------------------------------------------------------
# Function   : extractData
# Description: extracts infraction_description, set_fine_amount, and location2 from 
#              the data file and creates a new extracted data file
# Arguments  : filename
# Output     : None
# Returns    : None
#--------------------------------------------------------------------------

function extractData {

    local dataFile=$1
    
    # Note: how to pass a string with spaces to a function explained here:
    #       https://stackoverflow.com/questions/1983048/passing-a-string-with-spaces-as-a-function-argument-in-bash
    eval infractionCode="$2"

    local outputFile=$3

    local num_rows=$(wc -l < "$dataFile") # get the number of lines to process
    ((num_rows-=1)) # substract the header line

    local rows_counter=0

    print_separator "Extract Data"
    echo "Extracting Data from File"

    while read -r line
    do  
        if [[ $line =~ 'infraction_description' ]]; then    # Header Line

          echo $line | awk -F, '{print $4","$5","$8}' > $outputFile
        
        else
        
          # Note: how to get multiple columns in awk explained here:
          #       https://stackoverflow.com/questions/60928016/printing-multiple-columns-with-awk-but-joined-by-semicolon

          echo $line | awk -F, '{print $4","$5","$8}' | grep "$infractionCode" >> $outputFile

          rows_counter=$(($rows_counter + 1))  # increment row counter

          ProgressBar $rows_counter $num_rows
        fi

    done < $dataFile

    echo ""
    echo ""
    echo "Filtered information sent to $outputFile"

}

#--------------------------------------------------------------------------
# Function   : printSeparator
# Description: prints a seprator message on the screen 
# Arguments  : message
# Output     : banner with the message
# Returns    : None
#--------------------------------------------------------------------------
function print_separator {

   local message=$1

   echo ""
   echo "=================================================================================="
   echo " $message "
   echo "=================================================================================="
   echo ""
}

#--------------------------------------------------------------------------
# Function   : ProgressBar
# Description: shows a progress bar indicating progress 
# Arguments  : current value, total value
# Output     : progress bar and percentage
# Returns    : None
# 
# Note: this code is from: https://stackoverflow.com/questions/238073/how-to-add-a-progress-bar-to-a-shell-script

#--------------------------------------------------------------------------
function ProgressBar {
# Process data
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done
# Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

# 1.2 Build progressbar strings and print the ProgressBar line
# 1.2.1 Output example:                           
# 1.2.1.1 Progress : [########################################] 100%
printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%%"

}

#################################################################################
# main 
#################################################################################

if [[ -e $filename ]]
then

  
  ### get infraction Types
  getInfractionTypes $filename

  ### get stats
  getStats $filename

  ### extract data 
  # Note: how to pass a string with spaces to a function explained here:
  #       https://stackoverflow.com/questions/1983048/passing-a-string-with-spaces-as-a-function-argument-in-bash
  extractData $filename "\${infractionCode}" $extractDataFile
else
  echo "ERROR: $filename does not exist"
fi


