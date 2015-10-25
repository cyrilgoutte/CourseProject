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

### How the script works:
The script goes through the following steps.
(Check comments inside the scripts for more details.)

0. (Optional) Download the data from the web and unzip it.

1. Merge training and test data (features, subject indicator and label)
   into a single 10299x563 data frame

2. Select columns that involve computing mean or standard deviation
   of some measurements. This results in a 10299x68 data frame.

3. Replace activity indicators (1..6) with descriptive activity names.

4. Name features columns with "descriptive" names.
   See CodeBook.md for more details on the features/variables.

5. Build a summary data frame with means of each feature for each
   (Subject,Activity) pair. Result is a 180x68 data frame.

The final 180x68 wide format dataset is saved to disk as "tidy.txt".
