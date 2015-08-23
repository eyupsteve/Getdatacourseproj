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
This file contains the actual data for the test portion

* testactivityid for the file "Y_test.txt"

  * This file contains a single column, with a number that corresponds to an activity in the "activity_labels.txt" file, denoting the activity performed in each rows test

* testsubjectid for the file "subject_test.txt"

  * This file contains a single column showing the id of the subject who performed that rows test

* xtraindata for the file "X_train.txt"
  *This file contains the actual data for the train portion

* trainactivityid for the file "Y_train.txt"

  * This file contains a single column, with a number that corresponds to an activity in the "activity_labels.txt" file, denoting the activity performed in each rows test

* trainsubjectid for the file "subject_train.txt"

  * This file contains a single column showing the id of the subject who performed that rows test

* actlabels for the file "activity_labels.txt"
* varlabels for the file "features.txt"