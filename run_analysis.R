run_analysis <- function()
{
   
   ##initial setup, set working directory and creates variables for file loading, 
    directory <- getwd()
    locations <- vector()
    locations[1] <- paste(directory, "/UCI HAR Dataset/test/X_test.txt", sep = "")
    locations[2] <- paste(directory, "/UCI HAR Dataset/test/Y_test.txt", sep = "")
    locations[3] <- paste(directory, "/UCI HAR Dataset/test/subject_test.txt", sep = "")
    locations[4] <- paste(directory, "/UCI HAR Dataset/train/X_train.txt", sep = "" )
    locations[5] <- paste(directory, "/UCI HAR Dataset/train/Y_train.txt", sep="")
    locations[6] <- paste(directory, "/UCI HAR Dataset/train/subject_train.txt", sep = "")
    locations[7] <- paste(directory, "/UCI HAR Dataset/activity_labels.txt", sep = "")
    locations[8] <- paste(directory, "/UCI HAR Dataset/features.txt", sep = "")
    
    ## checks all packages required
    ## and installs if neccesary, then loads libraries
    instpck <- installed.packages()
    neededpck <- c("dplyr")
    
    for(i in length(neededpck))
    {
       if(!neededpck[i] %in% rownames(instpck))
       {
          message("\n", neededpck[i], " not installed, installing now\n")
          install.packages(neededpck[i])
          
       }
       library(neededpck[i], character.only = TRUE)
    }
    
    ##load datasets into R
    xtestdata <- read.table(locations[1])
    testactivityid <- read.table(locations[2])
    testsubjectid <- read.table(locations[3])
    xtraindata <- read.table(locations[4])
    trainactivityid <- read.table(locations[5])
    trainsubjectid <- read.table(locations[6])
    actlabels <- read.table(locations[7])
    varlabels <- read.table(locations[8])
    
    
    ##Name dataset variables, then remove variables that are not mean or std
    names(xtraindata) <- varlabels$V2
    names(xtestdata) <- varlabels$V2
    names(testsubjectid) <- "Subject_id"
    names(trainsubjectid) <- "Subject_id"
    xtraindata <- cbind(xtraindata[grep("mean", names(xtraindata))], xtraindata[grep("std", names(xtraindata))])
    xtestdata <- cbind(xtestdata[grep("mean", names(xtestdata))], xtestdata[grep("std", names(xtestdata))])
    
    
    ## Creates a vector with appropriate activity names for id given in Y_test.txt and Y_train.txt
    test_activity_name <- actlabels[[2]][testactivityid$V1]
    train_activity_name <- actlabels[[2]][trainactivityid$V1]
     
    ##Bind the test data together, and the train data together
    testdata <- cbind(testsubjectid, test_activity_name, xtestdata)
    traindata <- cbind(trainsubjectid, train_activity_name, xtraindata)
    
    ##rename mismatched columns to allow for binding
    testdata <- rename(testdata, Activity_Name = test_activity_name)
    traindata <- rename(traindata, Activity_Name = train_activity_name)
    
    ## Merge the datasets
    mergeddata <- rbind(testdata, traindata)
    
    ## Rename variables to human readable versions
    names(mergeddata) <- sub("\\()", "", names(mergeddata))
    names(mergeddata) <-  sub("^t", "Time_Domain_", names(mergeddata))
    names(mergeddata) <- sub("^f", "Freq_Domain_", names(mergeddata))
    names(mergeddata) <- sub("Gyro", "_Gyrometer_measurement", names(mergeddata))
    names(mergeddata) <- sub("Acc", "_Accelerometer_measurement", names(mergeddata))
    names(mergeddata) <- sub("Mag", "_Magnitude", names(mergeddata))
    names(mergeddata) <- sub("BodyBody", "Body", names(mergeddata))
    names(mergeddata) <- sub("Jerk", "_Jerk", names(mergeddata))
    
    ## Write the table to disk
    write.table(mergeddata, "tidydata.txt", row.names = FALSE)
    
}



