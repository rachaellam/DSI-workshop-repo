# Assignment 2 of the Data Science Foundations Course (Version Control & GitHub)

## Introduction
This project was completed for part 2 of Assignment 2 for the Data Science Foundations 
course. Assignment 2 was focused on Version Control & Github, and part 2 was specifically
focused on the use of GitHub. This repository contains all of the inputs, outputs, and 
scripts produced for Assignment 1 of the Data Science Foundations course. In Assignment 1,
we were tested on our ability to write scripts using basic commands, variables, filters, 
and loops. The goal of Assignment 2, part 2 was to use the files generated from Assignment 
1 in order to gain practical experience with GitHub. Thus, we have uploaded the contents
of Assignment 1 onto a class GitHub repository through a pull request. The rest of this
README will detail how to make use of the files generated in Assignment 1. In Assignment 
1, we created a script that takes Toronto Parking Data as an input and extracts specific
information from that CSV file.

## Prerequisites 
There are no prerequisites required for using this project. 

## Dataset
The dataset used in this project is the Parking Tickets dataset from the City of Toronto
Open Data Catalogue (https://open.toronto.ca/dataset/parking-tickets/). This dataset 
contains non-identifiable information relating to each parking ticket issued from Jan 1,
2020 to Feb 11, 2020. 

## Usages
This project allows us to perform multiple functions. We constructed 3 functions in our 
script so when run it is able to perform 3 tasks:
	1. Print all unique types of parking infractions (column = infraction_description)
	2. Calculates and prints the mean, max, and min for column 5 ("set_fine_amount")
	3. Extracts all rows for private property infractions and outputs them to a new .csv 
	   file. Specifically outputs only 3 columns from the Parking Tickets dataset: 
	   infraction_description, set_fine_amount, and location_2. The new .csv file is 
	   labelled: private_property_parking_data.csv. 

## Folder Structure
The repository consists of three folders:
	- Inputs: the inputs folder contains the raw data used in our script and should not be 
	  edited. Specifically it houses the parking_data.csv file that was retrieved from:
	  https://open.toronto.ca/dataset/parking-tickets/
	- Outputs: contains the files that are generated from running the script in this 
	  project (Assignment1.sh). The file housed in this folder is 
	  private_property_parking_data.csv. 
	- Scripts: contains scripts associated with this project. This folder houses one 
	  script titled Assignment1.sh. Running this script performs the functions outlined in 
	  the Usages section.  

## Installation
There are no prerequisite packages required to run this project; it is all self-contained
within this repository. In order to run this project, you must first fork this repository
to your GitHub, and then clone it onto your local machine. 

Then, using the command line, you must navigate to the Scripts folder discussed in the 
Folder Structure section. Once in that folder you can run the Assignment1.sh script, which 
should perform all of the functions outlined in the Usages section. Importantly, you must 
assign the parking_data.csv file as positional parameter #1 in order for the script to run 
correctly.

In order to do so from the Scripts folder, you will need to navigate to the Inputs folder
like so: '../Inputs/parking_data.csv'. Below is the appropriate code for running this 
project if your working directory is the Scripts folder.

```
./Assignment1 ../Inputs/parking_data.csv
```

## Support 
For support regarding the dataset visit: [Toronto Parking Tickets](https://open.toronto.ca/dataset/parking-tickets/)

## Contributing
Script created by Garrett Bullivant
Email: garrett.bullivant@mail.utoronto.ca
GitHub username: garrettb44
Last updated: March 1, 20223
