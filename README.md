GettingAndCleaningData
======================
### About this Repo

This is a submission for "Getting And Cleaning Data" course's Peer Reviewed Project:
* __UCI HAR Dataset__:   The the folder of raw and origin data
* __run_analysis.R__:    The R script that extract relevant data from the raw data
* __tidy_data_set.txt__: The output of the R script
* __Codebook.md__:       Description of the output data
* __GettingAndCleaningData.Rproj__: The R Studio project file (ignore if you don't use R Studio)

### Instructions on how to execute 'run_analysis.R'

1. Fork this repo and download everything into a folder on your local machine. This repo also includes the raw data. You can provide your own data to save some bandwidth and skip the 'UCI HAR Dataset' folder.
2. If you use R-Studio, simply open 'GettingAndCleaningData.Rproj' project file. The Working Directory will be set automatically for you. Else, remember to use 'setwd()' to set the working directory to the folder of this repo.
3. Open 'run_analysis.R' and make sure the list of file locations is correct, especially if you use your own data
4. Run this script using the source() command.
5. A text file named 'tidy_data_set.txt' will be created (overwritten if it's already there) in the same directory as the script.

