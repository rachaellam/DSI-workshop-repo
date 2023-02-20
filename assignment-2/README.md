#CITY OF TORONTO PARKING INFRACTIONS DATA 2020#

**Introduction**
This project was created to
- display all types of parking infractions from the City of Toronto in an Ubuntu terminal
- print minimum, maximum and mean values of parking fines
- pull and export all records of the "PARK - ON BOULEVARD" infraction with associated fines and street locations into a new csv file

**Folder Structure**
/scripts - you can run the script by using the path /scripts/DSI-UNIX.sh
/inputs - the file topark.csv is the 2020 parking dataset downloaded from the City of Toronto's [Open Data Portal] (https://open.toronto.ca/dataset/parking-tickets/).
/outputs - this folder will hold the sorted topark.csv data and the infraction.csv file will contain the specified "PARK - ON BOULEVARD" data after you run the script.

**Instructions**
1. DSI-UNIX.sh uses three positional parameters. This means in addition to entering ./scripts/DSI-UNIX.sh, you will need to add the following to your cmd line:
    1. ./inputs/topark.csv
    2. ./outputs/filenameofyourchoice1.csv
    3. ./outputs/filenameofyourchoice2.csv
2. Your cmd line should look like this: ./scripts/DSI-UNIX.sh ./inputs/topark.csv ./outputs/example1.csv ./outputs/example2.csv
3. When the script has finished running, you can check your outputs folder for infraction.csv to view the "PARK - ON BOULEVARD" data.