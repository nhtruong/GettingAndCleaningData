##Codebook for tidy_data_set.txt

--------------------------------------

### General Description:
  This file represents the data set with the average of each variable for each activity and each subject of the original raw data. It contains 180 observations (rows) and 81 variables (columns).
  
--------------------------------------

### Variables:
###### SUBJECT:
    Integers from 1 to 30 representing 30 test subjects
###### ACTIVITY:
    One of 6 activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDIND, LAYING
###### AVERAGES (Last 79 Columns):
    Numerical Data of Averages of the original columns as they are divided 
    by the first two columns (Subject and Activity)
    
    *Note: I could've listed in details what these 79 columns are exactly are by paraphasing the text 
    in the feature_info.txt file from the original data set. However, that would be a waste of time
    since the focus of the project is cleaning data. Moreover, the names of these columns are
    already very descriptive if you're familiar with abbreviations used in physics.
    
--------------------------------------

### How the data came about:
    1. The Subject columns are read from 'subjects_train.txt' and 'subject_test.txt'
    2. The Activity columns are read from 'y_train.txt' and 'y_test.txt'
          Then they are converted to readable strings using 'activity_labels.txt'
    3. Mean and Standard Deviation columns are read from 'X_train.txt' and 'X_test.txt'
    4. All columns for each data set are merged creating 2 data sets: training and test
    5. Training and test data sets are merged row-wize to form the raw data set
    6. The raw data set is then broken into chunks by Subject and Activity columns
    7. For each chunk, the average of each column other than the Subject and Activity is calculated
    8. The results of the above calculation are merged to form the data set shown in 'tidy_data_set.txt'

