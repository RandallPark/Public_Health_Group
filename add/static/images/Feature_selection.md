##Public_Health_Group : Feature Selection algorithm
# 
# Feature Selection - using R's Boruta library 
# -----------------------------------------------

# *Background:*
1. Used as a tool to support our feature selection process with sufficient statistical significance.
2. Two of our data sets were large with about 1.5 million records in each with 70 to 80 features.
3. We wanted a method to narrow down our focus area to minimize our time and effort in analyzing our data.
4. We also wanted that the method helps us to get 'meaningful insights' with sufficient statistical significance .
# *What was the problem?*
1. With large datasets with > 50 features, it is often a challenge to conclude on the features that add value
   to our analysis.  Often this is done using a fair method that provides information about features that
   contribute the most to achieve our accuracy and minimizing the error in classifying our outcome with sufficient
   statistical power and significance.
2. Analysis was done using R language which isn't part of this project.
3. We researched for a fair method that would help us in choosing the variables of importance and employed it
   in our project.
4. The R's 'Boruta' - It is a feature selection wrapper algorithm, which works around RandomForest. It derives its name
   from Slavic mythology - name of a demon who dwelled in the pine forests (Ref.analyticsvidhya.com). 
5. RandomForest Machine Learning algorithm is a 'Decision Tree' based approach which uses techniques such as voting, bagging and 
   boosting in growing several decision trees and choosing the trees that have the best classification accuracy and out-of-bag-error
   rates.
#  *How, and Why Boruta?*
   Refer: https://www.analyticsvidhya.com/blog/2016/03/select-important-variables-boruta-package/
#  *Application of RandomForest to our dataset*
1. Our two main data sets were all categorical and there weren't any numeric data in them.
2. It gets even harder with all categorical data where quantification of the variability within each feature is challenging as it 
   heavily depends on the number of categories (levels) it has.
3. This can be performed using two measures called 'gini measures for importance' when features are added or removed from a predictive
   model built to classify the data into target classes.
4. Both our data sets were categorical our CSVs were pre-coded with numeric values for the text categories.
5. We recoded our dataset in SQL, mapping the corresponding text categories to perform our 'Feature Selection' analysis.
6. The 80 columns in our discharges data set was reduced to 58 columns by filtering out the flag columns along with a few insignificant
   ones such as index, caseid etc.
7. We drew a small sample of 0.1% of data (1050 records out of 1.5 million) using a radomized sample selection method to train and test
   a classifying model.
8. We built a Predictive Model using the Random Forest Classifier algorithm with the training dataset(735 records), and observed its        output using the test dataset (315 records).
9. We observed the model's output and predicted probability.
10. We built a second model with all the non-rejected features (excluding the unimportant features) and listed its prediction.
11. We built a third model with only the confirmed features (excluding the tentative and unimportant ones) listed its prediction.
12. Our observations of the model's output, we noticed that our second model to be showing better accuracy and out-of-bag error-rate         compared to the other two models.
#  *What is Next?*:
   We plan to use Boruta's recommendations to analyze our data.
