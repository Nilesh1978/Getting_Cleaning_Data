# **Steps used in creating Tidy Data submitted for the course project**


## Use steps below
1. Make sure all the .txt files used for the analysis are explicitely listed in the current working directory and not in a folder
2. load required libraries
3. read files using list.files function
4. print the list of files
 + [1] "activity_labels.txt"
 + [2] "features.txt" 
 + [3] "features_info.txt"
 + [4] "README.txt" 
 + [5] "subject_test.txt" 
 + [6] "subject_train.txt" 
 + [7] "X_test.txt" 
 + [8] "X_train.txt"
 + [9] "y_test.txt" 
 + [10] "y_train.txt"
5. use read.table function to read the above data files
6. change variable names for these data files to make sense of the data
7. use cbind function to combine the subject, X, & Y data files for both train and test sets
8. use merge function to combine the newly created *test* and *train* sets with *activity* file by using **Code** as an id variable
9. use rbind function to bind the train and test sets created in step 8
10. remove the duplicated variables
11. use grepl function to select the variables with **mean** and **std** in their column names.  Store this selected variables in a new data frame
12. also select **Code**, **Subject**, & **Activity** variables and store them in a new data frame
13. use cbind function to combine the two data frames created above in steps 11 & 12.
14. change *Subject* variable from an integer to a factor using as.factor function
15. use *aggrgate* function to generate tidy data as specified by the assignment.  This function calculates mean for the selected variables for the **Subject** and **Activity** combinations.
16. use write.table function to export the **tidy_data.txt** file submitted for this course assignment.


