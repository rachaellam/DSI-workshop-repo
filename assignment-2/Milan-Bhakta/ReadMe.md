This script processes Toronto parking ticket data and performs the following:

1. Prints all types of parking infractions.
2. Prints the mean, min, and max set_fine_amount.
3. Saves a chosen type of parking infraction to a separate CSV file. Default is "PARK ON PRIVATE PROPERTY" 

### Usage:
- Place the `parking_data.csv` file in the `inputs` folder.
- Run the script using the provided shell script: `./script.sh`.
- The output CSV file will be saved in the `outputs` folder.

### Instructions:
1. To run the script, execute `./script.sh` in the terminal.
2. If permission is denied, change file permission to 755 using `chmod 755 script.sh`.
3. Ensure the `parking_data.csv` file is available in the `inputs` folder.