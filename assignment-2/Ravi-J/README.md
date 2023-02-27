
# **Script to extract data from Toronto Parking Tickets repository (assignment 1: Unix and Data)**

## Introduction:

Project uses Toronto parking tickets data from Jan 1, 2020 - Feb 11, 2020 [Toronto Parking Tickets] (https://open.toronto.ca/dataset/parking-tickets/) as the input file to run a script to extract data for specific parking infractions.

## Usage:

This project can be used to extract specific types of parking infractions or any combination of those from the main dataset of parking tickets available from the Toronto data repository (link given above). Output is automatically extracted to a separate csv file. Script also calculates min and max values in the set-_fine_amount column automatically. 


## Navigation guide:

	* Input folder houses the parking tickets dataset (2020-Toronto-Parking-Tickets.csv) 

	* Script folder includes the script used to run and extract the following:
		- print all types of parking infractions from the dataset
		- print the minimum and maximum fine amount (set_fine_amount)
		- extracts all tickets issued for infraction titled "Park on Private Property" and 			saves it into an output file

	* Output folder includes extracted data on tickets given for "Park on Private Property" as 	the infraction description - includes fine amount as well as address where ticket was issued.

## Technologies: 

BASH script created using Sublime Text build 4143

## Where to begin:

	* Review this README.md file for instructions
	* Review Script folder to open assignment-adj.sh. Script uses positional parameters for 	input and output files and is set to extract data for 'Park on Private Property" infraction 	as the output file. Adjust to choose any infraction or combination of infractions as the 	output. 

## For help and other resources:

- [Toronto Parking Tickets] (https://open.toronto.ca/dataset/parking-tickets/)


## Contribution:
Script created by RJ
Last updated: Feb 15 2022





