############################################################
### Feature Selection / Feature engineering in R
### Public_Health_Group, USC Substance Abuse in the USA Project
### Data Set : Substance Abuse and Mental Health Services Administration (SAMHSA) / 1048575 records
### From admissions.csv and discharges.csv
### Script helps in identifying the features of importance using R's Boruta feature selection algorithm
### (a wrapper algorithm) based on mean decrease in accuracy and error rate by creating shadow features and
### mixing them with the original features and applying weights based on their relative variability with their
### shadow features' mean (min, avg and max).
### R Script by: Jamuna Prakash
### R version: 3.6.0 (04-26-2019)
### Start Date: 05-23-2019
### End Date:
### Question#1. Is there a way to identify the features of importance for this study in determining whether
###             patients declared 'Treatment Completed' actually completed or not?
### Question#2. Can a ML model be built to determine the effectiveness of a treatment combining
###             these features?
### Script Modified by: Jamuna Prakash
### Script Modified date: 05/27/2019
############################################################
# The following code installs the latest version of R
#install.packages("installr")
#library(installr)
#updateR()

# The following code takes care of reproducability
library(checkpoint)
checkpoint("2019-05-27")
require("foreach")

library(mise)
library(xlsx)
library(RcmdrPlugin.EZR)
library(psych)
library(data.table)
library(tidyverse)
library(reshape2)
library(Boruta)
library(mlbench)
library(caret)
library(randomForest)
library(RMySQL)
# tO TEST THE 

### Clear workspace
rm(list = ls())
### Step1: Load data, and run numerical, graphical summaries
cwd <- getwd()
file_path <- "../Desktop/CLASSWORK_JP/USCLOS201812DATA1/Public_Health_Group/data"
file_path <- file.path(file_path, fsep = .Platform$file.sep)
setwd(file_path)
print(getwd())

# Accessing data in the MySql database...

# Connect to database
project2_db = dbConnect(MySQL(), user='root', password='root', dbname='project2', host='127.0.0.1')

# List databases
dbListTables(project2_db)

# List database tables
#dbListFields(project2_db, "adm_lookups")

###----------ONE TIME WORK START------------------###

##########################################
# Data Extraction, Writing into CSVs
##########################################

# Prepare and send a query to the database
#@ADM admissions_raw_recoded table 
admissions_raw_recoded_rs = dbSendQuery(project2_db, "SELECT * FROM admissions_raw_recoded")

# Fetch data
admissions_raw_recoded_data = fetch(admissions_raw_recoded_rs, n=-1) # 'n=-1' Fetches all

# Check the result
head(admissions_raw_recoded_data)

# Clear the resultset.
dbClearResult(dbListResults(project2_db)[[1]]) # TRUE closes the result set and releases the connection 

# Write the results to a csv
write_to_path <- paste(getwd(), "/admissions_raw_recoded.csv", sep = "", collapse = NULL)
write.csv(admissions_raw_recoded_data, write_to_path)

# Repeat the above steps for discharges_raw_recoded table
#@DISCH - discharges_raw_recoded table 
discharges_raw_recoded_rs = dbSendQuery(project2_db, "SELECT * FROM discharges_raw_recoded")
discharges_raw_recoded_data = fetch(discharges_raw_recoded_rs, n=-1)
head(discharges_raw_recoded_data)
dbClearResult(dbListResults(project2_db)[[1]])
# Write the results to a csv
write_to_path <- paste(getwd(), "/discharges_raw_recoded.csv", sep = "", collapse = NULL)
write.csv(discharges_raw_recoded_data, write_to_path)

###----------ONE TIME WORK FINISH------------------###

##########################################################################
# Exploratory analysis part - Data set has been recorded to its text levels
##########################################################################

# Read the recoded csv
admissions_raw_recoded_df <- read.csv(file = paste(c(getwd(), "/admissions_raw_recoded.csv"), collapse = ""), sep = ',', header = TRUE);
head(admissions_raw_recoded_df)

attach(admissions_raw_recoded_df) # Chaches the dataframe in R's workspace for use

# Check for the dimensions of the two dataframes
dim(admissions_raw_recoded_df) # 1048575 rows and 64 cols; incl. index, caseid cols

# Let's clean up the data a bit.
# Let's seperate the encoded flag features from features of interest.
reduced_adm_recoded_data <- admissions_raw_recoded_df[, c(3:39, 58:61)]
one_hot_adm_recoded_data <- admissions_raw_recoded_df[, c(40:57)]
colnames(reduced_adm_recoded_data)
colnames(one_hot_adm_recoded_data)
dim(one_hot_adm_recoded_data) # 18 cols; sub flags
dim(reduced_adm_recoded_data) # 41 cols

# Compute the number of levels for each variable in
# both the dataframes
admissions_recoded_data_levels <- cbind.data.frame(Variable=names(reduced_adm_recoded_data),
                          Total_levels=sapply(reduced_adm_recoded_data, function(x)
                            {as.numeric(length(levels(x)))}))
print(admissions_recoded_data_levels)

### A quick check for the data structure. (All are categorical, except year_de)
str(reduced_adm_recoded_data)
#----------------------------------------------------
# Repeat the same for discharges_raw_recoded dataset.
#----------------------------------------------------
discharges_raw_recoded_df <- read.csv(file = paste(c(getwd(), "/discharges_raw_recoded.csv"), collapse = ""), sep = ',', header = TRUE);
head(discharges_raw_recoded_df)
attach(discharges_raw_recoded_df)
dim(discharges_raw_recoded_df) # 1048575 rows and 80 cols; incl. index, caseid cols
colnames(discharges_raw_recoded_df)
reduced_disch_recoded_data <- discharges_raw_recoded_df[,c(2,4:53, 73, 74:78, 80)]
one_hot_disch_recoded_data <- discharges_raw_recoded_df[, c(55:72)]
colnames(reduced_disch_recoded_data)
colnames(one_hot_disch_recoded_data)
dim(reduced_disch_recoded_data) # 58 cols; includes index, caseid cols.
dim(one_hot_disch_recoded_data) # 18 cols; sub flags
discharges_recoded_data_levels <- cbind.data.frame(Variable=names(reduced_disch_recoded_data),
                                                   Total_levels=sapply(reduced_disch_recoded_data, function(x)
                                                   {as.numeric(length(levels(x)))}))
print(discharges_recoded_data_levels)

##################################################
# Feature Engineering (Using Boruta package in R)
##################################################
# Pick a random sample 1000 records out of 1048575 records (~=0.1% data)
set.seed(12)
reduced_adm_recoded_data <- data.table(reduced_adm_recoded_data)
sample_adm_raw_rec_data <- reduced_adm_recoded_data[sample(.N, 1050)]
# Split the reduced_adm_recoded_data into training and testing data sets
set.seed(13)
dt <- sort(sample(nrow(sample_adm_raw_rec_data), nrow(sample_adm_raw_rec_data)*.7))
sample_adm_raw_rec_data_train  <- sample_adm_raw_rec_data[dt,]
sample_adm_raw_rec_data_test <- sample_adm_raw_rec_data[-dt,]
# Check dimensions
dim(sample_adm_raw_rec_data_train) # 735 rows; 41 cols
dim(sample_adm_raw_rec_data_test) # 315 rows; 41 cols

# Do the same to reduced_disch_recoded_data into train and test sets
# We have learned that using the entire data is choaking the system
# The idea is to take a random sample of 10000 (~=.1%)data from the 1048575 records
set.seed(10) # For repeatability
reduced_disch_recoded_data <- data.table(reduced_disch_recoded_data)
sample_disch_raw_rec_data <- reduced_disch_recoded_data[sample(.N, 1050)] 
# Split the sample data further into training and testing data sets
set.seed(20)
dt <- sort(sample(nrow(sample_disch_raw_rec_data), nrow(sample_disch_raw_rec_data)*.7))
sample_disch_raw_rec_data_train  <- sample_disch_raw_rec_data[dt,]
sample_disch_raw_rec_data_test <- sample_disch_raw_rec_data[-dt,]
dim(sample_disch_raw_rec_data_train) # 735 records, 58 cols
dim(sample_disch_raw_rec_data_test) # 315 records , 58 cols
################################################################################
# Run Variables of importance analysis on sample_disch_raw_rec_data_train (735 records)
# Target Class is $reason_class - Treatment Completed / Treatment Incomplete
##################################################################################
boruta.sample_disch_raw_rec_data_train <- Boruta(reason_class~.-(reason_de), data = sample_disch_raw_rec_data_train, doTrace = 2, maxRuns = 500)
print(boruta.sample_disch_raw_rec_data_train)
#windows(width=20, height=12)
#plot.title(main = "Features of importance in patients' discharges data")
plot(boruta.sample_disch_raw_rec_data_train, las=2, cex.axis = 0.7)
# 22 -IMPORTANT FEATURES (green)- FOR A TREATMENT TO BE CALLED 'COMPLETE' OR 'INCOMPLETE'
# route_1_de, freq1_de, sub3_d_de,primpay_de, psyprob_de, daywait_de, detcrim_de, livarag_de,freq_atnd_self_help_de,
# los_de, sub3_de,sub1_de, employ_d_de, sub1_d_de, sub2_d_de, region_de, stfips_de, freq_atnd_self_help_d_de,
# division_de, livarag__d_de,freq1_d_de,services_d_de,services_de
# 5 - TENTATIVE FEATURES (yellow - alg is confused about these)- OPTIONAL TO INCLUDE IN THE ANALYSIS.
# alcdrug_de, arrests_de, hlthins_de, freq1_de, freq2_de
# 29 - UNIMPORTANT
# Ideally, a shadow attributes (blue box plots) should not have any importance and must have
# zero values. However, the imp arrived for non-zero blue values can be
# used as benchmarks to min, avg and max importance for the shadow 
# attributes.
plotImpHistory(boruta.sample_disch_raw_rec_data_train) 
# According to the ML algorithm, the 'Tentative features' are those it
# couldn't come to a clear conclusion about their importance or role 
# in calling a treatment complete or incomplete.  
# However, it can help in grouping these into either important or 
# unimportant.
# To help with a quick decision about the tentative attributes, we can
# run the following tentative fix.
bor_fix <- TentativeRoughFix(boruta.sample_disch_raw_rec_data_train)
print(bor_fix)
# Gave the following output
# Boruta performed 499 iterations in 5.898579 mins.
# Tentatives roughfixed over the last 499 iterations.
# 25 attributes confirmed important: daywait_de, detcrim_de, division_de, employ_d_de,
# freq_atnd_self_help_d_de and 20 more;
# 31 attributes confirmed unimportant: age_de, alcdrug_de, arrests_de, detnlf_d_de, detnlf_de and 26 more;

# For more info about the features (Quick stat or computational
# justification on alg's classification strategy)
attStats(boruta.sample_disch_raw_rec_data_train)

# Let's see using the confirmed features helps in predicting the outcome with
# significant accuracy in classification or not.
# Let's use the the training data for classification
# We can use either RandomForest or glm or Neural Network types of ML algorithms for this.

# First we will use random forest on training set
set.seed(25)
rf_on_58 <- randomForest(reason_class ~. -(reason_de), data = sample_disch_raw_rec_data_train )
rf_on_58

#This is using all the features. Let's see what about using 
# only the features recommended by boruta...?
getNonRejectedFormula(boruta.sample_disch_raw_rec_data_train)

# Pasting the resulted formula in a randomforest model,
rf_on_27 <- randomForest(reason_class ~ stfips_de + services_de + sub1_de + sub3_de + 
                                  detcrim_de + arrests_de + methuse_de + psyprob_de + livarag_de + 
                                  hlthins_de + primpay_de + daywait_de + route1_de + freq1_de + 
                                  freq_atnd_self_help_de + services_d_de + sub1_d_de + sub2_d_de + 
                                  sub3_d_de + employ_d_de + livarag_d_de + freq1_d_de + freq_atnd_self_help_d_de + 
                                  los_de + division_de + region_de + alcdrug_de,
                                  data = sample_disch_raw_rec_data_train)

# Run all three models on test data (how good the models perform in predicting?)
# All 58 features
prob_58 <- predict(rf_on_58, sample_disch_raw_rec_data_test)
confusionMatrix(prob_58, sample_disch_raw_rec_data_test$reason_class)
# Non rejected 27 (22 + 5)features (confirmed and tentative)
prob_27 <- predict(rf_on_27, sample_disch_raw_rec_data_test)
confusionMatrix(prob_27, sample_disch_raw_rec_data_test$reason_class)
# Only confirmed
rf_on_22 <- randomForest(reason_class ~ stfips_de + services_de + sub1_de + sub3_de + 
                            detcrim_de + psyprob_de + primpay_de + daywait_de + route1_de + freq1_de + 
                            freq_atnd_self_help_de + services_d_de + sub1_d_de + sub2_d_de + 
                            sub3_d_de + employ_d_de + livarag_d_de + freq1_d_de + freq_atnd_self_help_d_de + 
                            los_de + division_de + region_de, data = sample_disch_raw_rec_data_train)

prob_22 <- predict(rf_on_22, sample_disch_raw_rec_data_test)
confusionMatrix(prob_22, sample_disch_raw_rec_data_test$reason_class)
##################################################################
# MODEL'S RECOMMENDATION: TO KEEP ALL NON-REJECTED IN THE STUDY!
##################################################################