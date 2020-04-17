## Introduction

This is the code book that describes the variables, data, and transformation works that has been performed to clean the data.

The original dataset was collected from Samsung Galaxy S smartphone to develop algorithms for tracking users movement. The original data was obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

*df* is the master data file that contains all data downloaded from the above website, organized in the following way:

*1.* Test data and train data are combined together, with test data in the top rows of *df* and train data in the bottom rows of *df*.

*2.* Each row represents a test measurement. Each column represents a variable. The variables includes the following:

 - *subject:* is the ID representing the test subject/person.

 - *activity:* describes the movement of the subject, e.g. walking, standing or sitting.

 - *561 feature vector:* are the time and frequency domain variables derived from each measurement.

We have further extracted the variables (in feature vector) that only contain mean and standard deviations.It is stored in the data frame *dfmeanstd*. In total 79 variables are captured.

Last, we have calculated the mean value for each variables, for the measurement that contains the same subject and activity. There are in total 6 activity and 30 subject. Therefore there are in total 6X30=180 mean values captured for each variable. They are stored in the data frame *summary*.  
