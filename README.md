# Run_analysis

## Initial setup, package verification and loading


The first action in the script is to set a vector of names for the files to be loadedinto the variable 
locations, this is simply the working directory obtained from the getwd() function with the appropriate 
location in the folder concatenated afterwards.

The next section gets a list of the installed packages in the current R setup, and compares this to a list
of packages needed by the function. If any are missing it will install them as needed. All the packages 
needed are then loaded using the library() function

### Loading

The datasets are then loaded into the following variables:
* xtestdata for the file "X_test.txt"
  *This file contains the actual data for the test portion

* testactivityid for the file "Y_test.txt"

  * This file contains a single column, with a number that corresponds to an activity in the "activity_labels.txt" file, denoting the activity performed in each rows test

* testsubjectid for the file "subject_test.txt"

  * This file contains a single column showing the id of the subject who performed that rows test

* xtraindata for the file "X_train.txt"

  * This file contains the actual data for the train portion

* trainactivityid for the file "Y_train.txt"

  * This file contains a single column, with a number that corresponds to an activity in the "activity_labels.txt" file, denoting the activity performed in each rows test

* trainsubjectid for the file "subject_train.txt"

  * This file contains a single column showing the id of the subject who performed that rows test

* actlabels for the file "activity_labels.txt"
  * This contains the activity names, with the corresponding numeric id
* varlabels for the file "features.txt"
  * This contains the names of all the claculations performed on the data, each name corresponding to
  a column of the data
  
##Naming the data

Firstly the data is named using the values taken from the varlabels table. The subject id variables 
are given the same name to allow for easy binding.

The tables are then redused to only the mean and std values by use of the grep function. This function
takes an expression and looks for matches. In this particular case searching for "mean" and "std" gives
the variables required. 

The angle functions, while including mean in the name, are not mean values so these are exluded. As
the angle functions include the name mean as Mean, no further work is required to remove these.

Two vectors are now created that have the appropriate activity name for each value in the activity id
tables. It is these vectors that are to be bound into the tables to give the activity for each row

##Binding the tables
The data is now binded together in two stages. Firstly all the test data is bound into one table named testdata, followed by the train data being bound into one table named traindata.

The activity data columns are now named, to allow them to be bound in the final table.

Finally, the two tables are merged using rbind into a table named mergedata, with the test data
forming the top of the table, and the train data the bottom.

##Variable Naming

The final step is to rename the variables to allow for easier reafing. This is done using the sub
function. This simply takes an expression followed by what you want to replace it with, and the vector
for it to be performed over. Here the shorter parts of the variable name are replaced by an expanded,
easier to read name.

## Writing to disk
The very last step is to write the file to disk, here the final data is outputted

