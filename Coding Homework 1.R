#### Question 1 #### 
#In Rstudio, you type code into the R terminal, or even the console.
#The output of the code is in the Rstudio history 
#There is a tab for that in the bottom right window of Rstudio for plots.
#The global environment is where R stores all variables, functions, and packages.
#There is a help tab in the bottom right window of Rstudio, it is just labeles “Help”. Here, there are tons of resources such as “Learning R Online” and “Getting Help with R”
#An R package is A package is a big set of codes already made for us, so we don’t have to. For example, Tidyverse is a package downloadable to R.
#A function is a reusable block of code that takes inputs, does an action (function), and returns an output.
#To find installed and loaded packages, As with most of these other tabs, there is a tab called “Packages” in the bottom right window on Rstudio, here there is a systems library of all packages being used. If it’s checked marked then it’s in use.
#The working directory is As with most of these other tabs, there is a tab called “Packages” in the bottom right window on Rstudio, here there is a systems library of all packages being used. If it’s checked marked then it’s in use.
#An Absolute file path is full map to a file from a computer’s root folder, less reproducible.
#A Relative file path is a short map to the folder you’re already in, more reproducible. 
#### Question 2 #### 
#From the beginning; if you open R for the very first time, you can click the R logo that has a plus on it in the top left corner of the page and go to version control. Link your github by posting your repository link with a name and where it is. Then, once you're done doing whatever in R, PUSH the repository from R to github and link the two.
#### Question 3 ####
# a vector is a string of values in a row
# a Matrices creates a table for one type of information, like numerical values or names. 
# A dataframe Can contain multiple data like matrices, but can contain data of different types.
# All of these things have one thing in common, they all store and can interpret data.
#### Question 4 ####

z <-1:200
#vector with range 1 to 200

mean(z)
#the mean of z 
sd(z)
#the standard deviation of z

zlog <- z > 30 
#all numbers in vector greater than 30 

zdf <- data.frame(z = z, zlog = log(z))
#Make a dataframe with z and zlog as columns. Name the dataframe zdf

colnames(zdf) <- c("zvec", "zlogic")
#changes name of the two column headers in zdf.


# Creates a new column named zvec squared
zdf$zsquared <- zdf$zvec^2

#Subsetting the dataframe WITHOUT the use of subset()
zdf_gt10_lt100 <- zdf[zdf$zsquared > 10 & zdf$zsquared < 100, ]

#Subsetting the dataframe WITH the use of subset()
zdf_gt10_lt100_subset <- subset(zdf, zsquared > 10 & zsquared < 100) 

#Subset the zdf dataframe to only include the values on row 26
zdf_row26 <- zdf[26, ]

#Subset the zdf dataframe to only include the values in the column zsquared in the 180th row.
zdf$zsquared[180]


#5. Download the Tips.csv file from Canvas. Use the read.csv() function to read the data into R using a relative file path and so that the missing values are properly coded. **Note the missing values are reported in the data as a period (i.e., “.”). How do you know the data was read correctly?

tips <- read.csv("TipsR.csv",
                 na.strings = ".",
                 stringsAsFactors = FALSE)
#"TipsR.csv" = Relative File Path
#na.strings = "."  =  converts uncoded data into N/A
#"stringsAsFactors = FALSE  = prevents these character columns from becoming factors.
#I know that this is a relative file path that was read correctly and not an absolute file path because the "." values are now simply "N/A" and unmanipulatable. 
#NOTE: AI was used to generate code for Question 5 to help find out to to make file path relative. 

#6. Annotate your code, commit the changes and push it to your GitHub repository you created last class.
 #Done. Github Link: https://github.com/Kam-42/PLPA-Class 







