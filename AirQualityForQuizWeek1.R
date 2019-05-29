## setwd("C:/Users/Office/Documents/RCourse/Week1")
setwd("M:/Documents/RCourse/Week1")
## This week 1 quiz uses the Air Quality dataset
## 1. Read the data
data<-read.csv("hw1_data.csv")
## 2. Get information about the data
# class (data) # what format the variables have been stored; what is the 'class' of each variable?
# str(data)
# summary (data)
# dim(data)
# head(data)
# tail(data)
# object.size(data)
# names(data) # list the variables in data
# nrow(data) # number of observations in dataframe

## Question 11: In the dataset provided for this Quiz, what are the column names of the dataset?
names(data)

## Question 12: Extract the first 2 rows of the data frame and print them to the console. What does the output look like?
head(data, 2) ## or
data[1:2,] ## You can extract the first two rows using the [ operator and an integer sequence to index the rows.

## Question 13: How many observations (i.e. rows) are in this data frame?
nrow(data)

## Question 14: Extract the last 2 rows of the data frame and print them to the console. What does the output look like?
tail(data, 2)
data[152:153,]

## Question 15: What is the value of Ozone in the 47th row?
data$Ozone[47]  ## you'll need to know the variable name in this case Ozone, or
data[47,] ## this will give the entire row and you can find the value of Ozone

## Question 16 How many missing values are in the Ozone column of this data frame?
length(which(is.na(data)))  # Calculate how many missing data on entire data frame, just to give you an idea, but this is not the answer, instead use,
## actual answer
datana<-subset(data,is.na(Ozone)) # Calculate how many missing date with column name of Ozone
nrow(datana)
## or another way to answer this
sum(is.na(data$Ozone))

## Question 17 What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation. 
## PREFERRED use na.rm is a great option for calculation where NAs might interfere

mean(data$Ozone, na.rm=TRUE)

# OR NOTE: This works only if you know there is only one more other column that has NAs.
# First, I stripped out the NA's from Column Ozone by using:
mydatacleanOzone<-na.omit(data[-2]) ## this excludes the 2nd column which also contains the NAs to maximize my sample size and only consider the NAs in the 1st column which is the Ozone layer
# Second, I see the total rows I have left in my new variable:
nrow(mydatacleanOzone) ## 116
# Third, I get the mean specific to the column by using the $ and then column name:
mean(mydatacleanOzone$Ozone)
# Answer [1]42.12931

# OR, but why the 2 in the apply???, RESEARCH....
mydatacleanOzone<-subset(data,!is.na(Ozone))
apply(mydatacleanOzone, 2, mean) ## why the 2????, research....

## Question 18 Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
# Use, Which, this gives index of booleans; $ selects columns.
mean(data[which(data$Ozone >31 & data$Temp > 90),]$Solar.R)

# OR
subset1<-subset(data, Ozone>31, select = c(Ozone, Temp, Solar.R))
subset2temp<-subset(subset1, Temp>90, select = c(Ozone, Temp, Solar.R))
mean(subset2temp$Solar.R)
# Answer [1] 212.8

# OR, but why the 2 in the apply???, RESEARCH....
subsetdata1<-subset(data,data$Ozone>31 & data$Temp>90,select=Solar.R)
apply(subsetdata1,2,mean) ## why the 2????, research....

## Question 19: What is the mean of "Temp" when "Month" is equal to 6?
# Use, Which, this gives index of booleans; $ selects columns.
mean(data[which(data$Month == 6),]$Temp)

## OR
tempdata<-subset(data, Month == 6, select=c(Temp, Month))
tempdata
mean(tempdata$Temp)
# Answer [1] 79.1

#OR, but why the 2 in the apply???, RESEARCH....
tempdata<-subset(data,data$Month==6,select=Temp)
apply(tempdata,2,mean) ## why the 2????, research....
## Answer: Temp 79.1

## Question 20: What was the maximum ozone value in the month of May (i.e. Month = 5)?
# Need to remove NA for this.
max(data[which(data$Month == 5),]$Ozone, na.rm = TRUE)

## OR but why the 2 in the apply???, RESEARCH....
ozonemax<-subset(data,!is.na(Ozone)&data$Month==5,select=Ozone)
apply(ozonemax,2,max) ## why the 2????, research....

## OR, use this only if you know there is one more other column in data frame with na's; in this case is column 2
ozonemax<-subset(data, Month==5, select=c(Ozone, Month))
ozonemax
mynewdata<-na.omit(ozonemax[-2]) ## this is to remove the missing values in the Ozone column only and omit the 2nd column.
max(subset(mynewdata, select=Ozone)) #or
max(mynewdata$Ozone)






