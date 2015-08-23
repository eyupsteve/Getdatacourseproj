##Codebook

The variables in the file "tidydata.txt" are taken from data from the "Human Activity Recognition
 Using Smartphones Dataset" by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

The summary of the experiments, taken from their README.TXT file, available in the data package at
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48
 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,
 SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its
 embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular
 velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data
 manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the
 volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and
 then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The
 sensor acceleration signal, which has gravitational and body motion components, was separated using
 a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is
 assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was
 used. From each window, a vector of features was obtained by calculating variables from the time
 and frequency domain.
 
The features.txt file, from the above package, then goes into detail about the way the data was
processed. This is an edited version of that

The features selected for this database come from the accelerometer and gyroscope 3-axial raw
 signals. These time domain signals were captured at a constant rate of 50 Hz. Then they were
 filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency
 of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and
 gravity acceleration signals using another low pass Butterworth filter with a corner
 frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk
 signals . Also the magnitude of these three-dimensional
 signals were calculated using the Euclidean norm 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals
 
##tidydata.txt 
 
The data in "tidydata.txt" is the mean and standard deviation values extracted from the above
 dataset, with the following naming convention for the variables, altered from that noted in the
 files above.

* Time_Domain indicates one of the time domain signal measurement.
* Freq_Domain indicates one of the measurement after a Fast Fourier Transform.
* Body indicates a body measurement.
* Gravity indicates a gravity measurement.
* Accelerometer_measurement indicates the measurement came from the accelerometer.
* Gyrometer_measurement indicates the measurement came from the gyroscope.
* Mean indicates a mean value.
* std indicates a standard deviation value.
* Jerk indicates a Jerk value.
* Magnitude indicate the value is the magnitude of the signal.
* X,Y,Z indicates the axis on which the measurement was taken.

Thus the variable  "Time_Domain_Body_Accelerometer_measurement_Jerk_Magnitude-mean" gives a value 
that is the mean of the time domain measurements of the body component taken with the accelerometer,
derived in time to get the jerk value. 

All values are in the samee units as original data

