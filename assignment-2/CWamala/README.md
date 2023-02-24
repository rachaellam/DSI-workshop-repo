# Assignment 2 (Git and GitHub) of the Data Science Foundations Course

## Description
This repository contains all of the files and documentation developed as part of Assignment 1 of the Data Science Foundations course.
The intended outcome for the assignment was to gauge students' ability to write scripts using basic commands, variables, filters and loops.

## Folder Structure
The repository consists of three folders:
- Inputs: contains files that will not be edited including raw data. This folder contains the raw data analyzed in the assignment, parking ticket data from the City of Toronto containing non-identifiable information relating to each parking ticket issued for the 2020 calendar year. The name of the file is parking_data.csv
- Outputs: contains files that were created during the project, specifically the csv file containing certain information about one type of parking infraction. The name of the file is Assignment1_extract1.csv
- Scripts: contains the script submitted as part of the assignment. The name of the file is DSF_assignment1.sh

## Installation
Save the following two files to your Desktop folder: DSF_assignment1.sh, parking_data.csv
Open your terminal and input the following in the command line: ./DSF_assignment1.sh parking_data.csv" to assign the csv file to positional parameter $1. 
Please note that the script will create a new file named Assignment1_extract1.csv in your Desktop folder. This is a CSV file that saves information for one type of parking infraction (PARK IN A FIRE ROUTE).
