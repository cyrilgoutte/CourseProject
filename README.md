# "Getting and cleaning data" course project

This repository contains the following files:
- README.md : this file
- tidy.txt : tidy dataset in text format (project submission)
- tidy.csv : tidy dataset in CSV format (easier to read in) 
- CodeBook.md : description of the variables
- run_analysis.R : the script that produced the tidy dataset

### How to run the preprocessing/analysis:

#### If you have not dowloaded the data:
Uncomment the three indicated lines (lines 7-9) in run_analysis.R.
Then, within R, do:
> source("run_analysis.R")

#### If you have the raw data:
Point the "mydir" variable in run_analysis.R (line 10) to the directory
containing the raw data.  Then, within R, do:
> source("run_analysis.R")

