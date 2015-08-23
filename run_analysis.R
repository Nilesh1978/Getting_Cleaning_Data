library(dplyr)
library(data.table)

# read .txt files as a list
list_files<- list.files(pattern = ".txt")

# find the files
list_files
#[1] "activity_labels.txt" "features.txt"        "features_info.txt"   "README.txt"         
#[5] "subject_test.txt"    "subject_train.txt"   "X_test.txt"          "X_train.txt"        
#[9] "y_test.txt"          "y_train.txt"     

# read individual files

# activity_labels
activity<- read.table(list_files[1])
dim(activity)
names(activity)<- c("Code", "Activity")
activity

# features
features<- read.table(list_files[2])
dim(features)
names(features)<- c("Feature_code", "Feature")
head(features)


# subject test
s_test<- read.table(list_files[5])
dim(s_test)
names(s_test)<- "Subject"
head(s_test)

# subject train
s_train<- read.table(list_files[6])
dim(s_train)
names(s_train)<- "Subject"

# x_test
x_test<- read.table(list_files[7])
dim(x_test)
names(x_test)<- features$Feature
head(x_test)

# add activity names to x_test using merge

# x_train
x_train<- read.table(list_files[8])
dim(x_train)
names(x_train)<- features$Feature
head(x_train)

# y_test
y_test<- read.table(list_files[9])
dim(y_test)
names(y_test)<- "Code"
head(y_test)

y_train<- read.table(list_files[10])
dim(y_train)
names(y_train)<- "Code"
head(y_train)

# cbind test and train data files

# test
test<- cbind(s_test, x_test, y_test)
dim(test)
head(test)

# train
train<- cbind(s_train, x_train, y_train)
dim(train)
head(train)


# merge
new_test<- merge(test, activity, by="Code")
dim(new_test)
new_train<- merge(train, activity, by="Code")
dim(new_train)

# rbind new_train & new_test data sets
DATA<- rbind(new_train, new_test)
dim(DATA)
names(DATA)

# remove the columns with duplicated column names
DATA <- DATA[ , !duplicated(colnames(DATA))]
dim(DATA)

# keep only the selected variables
DATA2<- DATA[grepl('mean|std', names(DATA))]
DATA3<- DATA[c("Code", "Subject", "Activity")]
DATA4<- cbind(DATA3, DATA2)
dim(DATA4)
colnames(DATA4)

DATA4$Subject<- as.factor(DATA4$Subject)
sapply(DATA4, class)

# create tidy data set
tidy_data<- aggregate(.~ Subject + Activity, data = DATA4, mean, na.rm=T)
dim(tidy_data)
head(tidy_data)

# export tidy data in a ".txt" format
write.table(tidy_data, file = "tidy_data.txt", row.name = FALSE)
