##Public_Health_Group : Feature Selection algorithm
# 
# Feature Engineering - using R's Boruta library 
# -----------------------------------------------
# *Background:*
# 	1. Used as a tool to support our feature selection process with sufficient statistical significance.
# 	2. Two of our data sets were large with about 10.5 million records in each with 70 to 80 features in each.
#   3. We wanted a method to narrow down our focus area to minimize our time and effort in analyzing our data.
#   4. We also wanted that the method helps us to get 'meaningful insights' with sufficient statistical significance .
# *What was the problem?*
# 	1. With large datasets with > 50 features, it is often a challenge to conclude on the features that add value
# 	   to our analysis.  Often this is done using a fair method that provides information about features that
# 	   ontribute the most to achieve our accuracy and minimizing the error in classifying our outcome with sufficient
# 	   statistical power and significance.
# 	2. Analysis was done using R language which isn't part of this project.
#   3. We researched for a fair method that would help us in choosing the variables of importance and employed it
#	   in our project.
#	4. The R's 'Boruta' - It is a feature selection wrapper algorithm, which works around RandomForest. It derives its name
#      from Slavic mythology - name of a demon who dwelled in the pine forests. 
#   5. RandomForest Machine Learning algorithm is a 'Decision Tree' based approach which uses techniques such as voting, bagging and 
# 	   boosting in growing several decision trees and choosing the trees that have the best classification accuracy and out-of-bag-error
#	   rates.
#  *How and Why Boruta?*
#      Refer: https://www.analyticsvidhya.com/blog/2016/03/select-important-variables-boruta-package/
#  *Application of RandomForest to our dataset*
#	1. Our two main data sets were all categorical and there weren't any numeric data in them.
#   2. It gets even harder with all categorical data where quantification of the variability within each feature is challenging as it 
#      heavily depends on the number of categories (levels) it has.
#   3. This can be performed using two measures called 'gini measures for importance' when features are added or removed from a predictive
#      model built to classify the data sets into target classes.
#   4. Both our data sets were categorical our CSVs were pre-coded with numeric values for the text categories.
#   5. We recoded our dataset in SQL, mapping the corresponding text categories to perform our 'Feature Selection' analysis.
#   6. The 80 columns in our discharges data set, we seperated the flag columns from our datasets and a few other insignificant
#      ones such as index, caseid etc.
#   7. Next, we took R's 'Boruta' library to task...! Its recommendations were quite interesting...!;)
#  *What is Next?*:
#		We plan to use Boruta's recommendations in analyzing our data!
