### Locations of relevant files (Make sure these are correct before attempting to run this script)
activity_labels.txt      = 'UCI HAR Dataset/activity_labels.txt'
features.txt             = 'UCI HAR Dataset/features.txt'

subject_train.txt        = 'UCI HAR Dataset/train/subject_train.txt'
X_train.txt              = 'UCI HAR Dataset/train/X_train.txt'
y_train.txt              = 'UCI HAR Dataset/train/y_train.txt'

subject_test.txt         = 'UCI HAR Dataset/test/subject_test.txt'
X_test.txt               = 'UCI HAR Dataset/test/X_test.txt'
y_test.txt               = 'UCI HAR Dataset/test/y_test.txt'

#--------------------------------------------------------------------------------------------------------------

### Use Regular Expression to locate features that are either means (mean) or standard deviations (std)
all_feat       = read.table(features.txt, header = F, sep = " ", stringsAsFactors = F)
feat_pattern   = '-(mean|std)([A-Z]|\\x28)'       # \\x28 represents UTF-8 open parenthesis
feat_idx       = grep(pattern = feat_pattern, x = all_feat[,2])
feat           = all_feat[feat_idx,]

### Load measure columns that match the features selected above
colClasses           = rep('NULL',nrow(all_feat))
colClasses[feat[,1]] = rep('numeric',nrow(feat))
measures_train = read.table(X_train.txt, header = F, colClasses = colClasses)
measures_test  = read.table(X_test.txt , header = F, colClasses = colClasses)
colnames(measures_train) = colnames(measures_test) = feat[,2]

### Load activitie columns and convert numbers into readable strings via factoring
act_lbl = read.table(activity_labels.txt, header = F, sep = " ")
activities_train    = read.table(y_train.txt, header = F, col.names = 'ACTIVITY')
activities_train[1] = factor(activities_train[[1]], levels = act_lbl[,1], labels = act_lbl[,2])
activities_test     = read.table(y_test.txt , header = F, col.names = 'ACTIVITY')
activities_test[1]  = factor(activities_test[[1]] , levels = act_lbl[,1], labels = act_lbl[,2])

### Load subject columns
subjects_train = read.table(subject_train.txt, header = F, col.names = 'SUBJECT')
subjects_test  = read.table(subject_test.txt , header = F, col.names = 'SUBJECT')

#--------------------------------------------------------------------------------------------------------------

### Merge columns, then merge training and test data sets
train    = cbind(subjects_train,activities_train,measures_train)
test     = cbind(subjects_test ,activities_test ,measures_test )
data     = rbind(train,test)


### Function to calculate the measures' averages of each group
getAverageMeasures  <- function(group) {
     means = colMeans(group[,3:length(group)])
     cbind(group[1,1:2],t(means))
}


### Split and group data by Activities and Subjects, calculate averages for each componen, then merge
data  = split(data,data[,1:2])
data  = lapply(data,getAverageMeasures)
data  = do.call('rbind',data)

### Output the final result as a text file in the working directory
write.table(data,file = 'tidy_data_set.txt', row.names = F)

