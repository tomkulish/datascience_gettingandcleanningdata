# Coursera Data Science - Getting and Cleanning Data
## by Thomas Kulish

The run_analysis.R script creates a reproducable script in which to clean up and create a "tidy" data set from the Human Activity Recognition Using Smartphones Dataset created by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 

## Execution

### Prerequs
* This was build using RStudio running R x64 3.2.1
* The libraies dplyr and reshape2 is installed while running the run_analysis.R. If you cannot install this library this code will not successfully execute

### Run the program
1. Open RStudio OR R
2. Browse to the location you installed the program. Make it your working directory.
3. Run source("run_analysis.R")

### Expected Output
```
> source("run_analysis.R")
[1] "Staring run_analysis.R"
Installing package into 'C:/Users/me_000/Documents/R/win-library/3.2'
(as 'lib' is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.2/reshape2_1.4.1.zip'
Content type 'application/zip' length 503646 bytes (491 KB)
downloaded 491 KB

package 'reshape2' successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\me_000\AppData\Local\Temp\RtmpWUvhpC\downloaded_packages
Installing package into 'C:/Users/me_000/Documents/R/win-library/3.2'
(as 'lib' is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.2/dplyr_0.4.2.zip'
Content type 'application/zip' length 2582665 bytes (2.5 MB)
downloaded 2.5 MB

package 'dplyr' successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\me_000\AppData\Local\Temp\RtmpWUvhpC\downloaded_packages

Attaching package: 'dplyr'

The following objects are masked from 'package:stats':

    filter, lag

The following objects are masked from 'package:base':

    intersect, setdiff, setequal, union

[1] "Downloading Data."
trying URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
Content type 'application/zip' length 62556944 bytes (59.7 MB)
downloaded 59.7 MB

[1] "Merging the train and test datasets."
[1] "Gathering the mean and std columns."
[1] "Attaching the activity to the dataset."
[1] "Creating better column names."
[1] "Creating the tidy dataset."
[1] "Program completed."
Warning messages:
1: package 'reshape2' was built under R version 3.2.2 
2: package 'dplyr' was built under R version 3.2.2 
```