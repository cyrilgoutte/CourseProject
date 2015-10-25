# "Getting and cleaning data" course project
## Code Book

### Where the data comes from:

This is a Human Activity Recognition dataset available from the UCI repository:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Preprocessing/processing:

We use the 7532 training observations and 2947 test observations to build a
single data set with 10299 observations.

The original dataset has 561 feature variables, one subject identifier and
one label (Activity). We build a tidy dataset focuing on 66 feature variables
containing the mean or standard deviation of some measurements. There are
- 8 3-axial measurements
- 9 scalar measurements
resulting in (8x3 + 9) times 2 (mean+std) equal 66 selected variables.

The raw data is lightly processed to compute the mean for each of the 66
variables for each (subject,activity) pair. There are 30 subjects and 6
activites, thus 180 rows in the final dataset.

### Variables in the dataset
The columns in the dataset are:

Col 1: subject identifier (labelled "Subject"), from 1 to 30.

Col 2: activity identifier (labelled "Activity"), one of 6 labels
  LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS

Columns 3 to 68: mean of the 66 target features, for the (subject,activity)
  The column name indicates the variable, and is composed of 4 parts:

  1. "time" or "freq" indicating whether the variable was captured in the
      time or frequency (using a FFT) domain.

  2. The core variable name:
      BodyAcc : Boby acceleration from the accelerometer
      GravityAcc : Gravity acclerelation from the accelerometer
      BodyAccJerk : Body "jerk" signal, ie derivative of linear acceleration
      BodyGyro : Body angular velocity capture from a gyroscope
      BodyGyroJerk : Body "jerk" signal, ie derivative of angular acceleration
      BodyAccMag : Magnitude of the body acceleration (Euclidean norm) 
      GravityAccMag : Magnitude of the gravity acceleration (Euclidean norm)
      BodyAccJerkMag : Magnitude of the body acceleration "jerk" signal 
      BodyGyroMag : Magnitude of the body angular velocity
      BodyGyroJerkMag : Magnitude of the body angular velocity "jerk" signal

  3. "Mean" or "Stdev" indicating whether the variable is the mean or the
      standard deviation of the measurement.

  4. Optionaly, for 3-axial measurments, a trailing X, Y or Z indicating
     the dimension along which it was measured.

The combination of time/freq domain, core variable name, mean/std and optional
dimension produces the 66 variables recorded in this dataset.

Units are not clarified in the original description (presumably SI units).
