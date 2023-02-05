

<<<<<<< HEAD
# Final-project
 
=======
# Heart Disease Prediction - Group 9


![ScreenShot](https://github.com/akhue02/final-project/blob/main/archive/human-heart-picture.jpg)

## Introduction

Heart disease describes a range of conditions that affect your heart. Diseases under the heart disease umbrella include blood vessel diseases, such as coronary artery disease, heart rhythm problems (arrhythmias) and heart defects you’re born with (congenital heart defects), among others.

The term “heart disease” is often used interchangeably with the term “cardiovascular disease”. Cardiovascular disease generally refers to conditions that involve narrowed or blocked blood vessels that can lead to a heart attack, chest pain (angina) or stroke. Other heart conditions, such as those that affect your heart’s muscles, valves or rhythm, also are considered forms of heart disease.
Heart disease is one of the biggest causes of morbidity and mortality among the population of world. Prediction of cardiovascular disease is regarded as one of the most important subjects in the section of clinical data analysis. The amount of data in the healthcare industry is huge. Data mining turns the large collection of raw healthcare data into information that can help to make informed decisions and predictions.

It is difficult to identify heart disease because of several contributory risk factors such as diabetes, high blood pressure, high cholesterol, abnormal pulse rate, and many other factors. Due to such constraints, scientists have turned towards modern approaches like Data Mining and Machine Learning for predicting the disease.

The purpose of this analysis is to determine whether the patients are at 'High Risk' or 'Low Risk' of getting heart disease based on different parameters captured in an observation file. Heart disease prediction analysis using the Supervised ML model could assist experts to make quicker decisions and help to take precautionary measures like lifestyle changes to reduce the risk.

## 
## Objective

The objective of this project is to address the following question:

- To determine what age group of people are most likely to have heart disease
- To determine which gender is highly susceptible to heart diasease
- To determine heart disease over chest pain type
- To determine the correlation between the factors
- To determine MaxHR by age

### Attribute Information: 

The dataset is composed of 11 attributes(columns) and 918 observations

1.Age: age of the patient [years]

2.Sex: sex of the patient [M: Male, F: Female]

3.ChestPainType: chest pain type [TA: Typical Angina, ATA: Atypical Angina, NAP: Non-Anginal Pain, ASY: Asymptomatic]

4.RestingBP: resting blood pressure [mm Hg]

5.Cholesterol: serum cholesterol [mm/dl]

6.FastingBS: fasting blood sugar [1: if FastingBS > 120 mg/dl, 0: otherwise]

7.RestingECG: resting electrocardiogram results [Normal: Normal, ST: having ST-T wave abnormality (T wave inversions and/or ST elevation or depression of > 0.05 mV), LVH: showing probable or definite left ventricular hypertrophy by Estes' criteria]

8.MaxHR: maximum heart rate achieved [Numeric value between 60 and 202]

9.ExerciseAngina: exercise-induced angina [Y: Yes, N: No]

10.Oldpeak: oldpeak = ST [Numeric value measured in depression]

11.ST_Slope: the slope of the peak exercise ST segment [Up: upsloping, Flat: flat, Down: downsloping]

HeartDisease: output class [1/True: High risk, 0/False: Low risk]

## Dataset source: https://www.kaggle.com/datasets/fedesoriano/heart-failure-prediction?select=heart.csv

## Entity Relationship Diagram

The Entity Relationship Diagram is created based on the heart information of the patients. We have added a column "PatientID" to the dataset to have a primary key as none of the columns in the dataset had unique values. 

SQL ERD: https://github.com/akhue02/final-project-/blob/main/HeartData_ERD_FinalProject.sql


![ScreenShot](https://github.com/akhue02/final-project/blob/main/ERD_PostgreSQL_Snapshot.png)


### Tableau 

Based on our Tableau file, we have 3 main findings: 
1. People aged between 50 and 60 are more likely to have heart disease; 
2. Males are more likely to have heart disease than females; 
3. Females aged 50 and 60 have the highest possibility to suffer from heart disease.

Link: https://public.tableau.com/app/profile/manish.thapa4247/viz/Heartrisk/HeartRisk_1?publish=yes

### Data Exploration

As part of the Data Exploration, the following steps were carried out:

#### Data Preprocessing
  The following steps were taken:
  * File was checked for any null values/empty columns
   Features and Target variables were identified. For this project, the feature variables were Age, Sex, ChestPainType, RestingBP, Cholesterol, FastingBS, RestingECG, MaxHR,, ExerciseAngina, OldPeak, ST_Slope. Target variable was Heart Disease.
  * Object columns were identified and checked for any additional binning  requirements before conversion to numeric values using HotEncoder classifier.

   ```python
   # Generate the categorial variable lists
heart_cat=df.dtypes[df.dtypes=="object"].index.tolist()
df[heart_cat].nunique()
  ``` 

  * A HeatMap based on the correlation between various features and RandomForestClassifier was used to rank features based on their relevance. 

 ![HeatMap](https://github.com/akhue02/final-project-/blob/main/archive/HeatMap_feature.png)

 ![Feature Importance](https://github.com/akhue02/final-project-/blob/main/archive/Feature_relevance.png)

 * Features with a relevance percentage of less than 1% were dropped from the analysis. 

 ```python
# choosing the columns with relevance below 1%
least_importance_df=importance_df[importance_df["Relevance"]<0.01]
least_relevant=least_importance_df["Features"].tolist()
least_relevant
 ```

 * Further MinMaxScaler was used to scale the data and the data was split into training and testing. 


#### Evaluation and Testing

  * As part of the analysis, we used three models that is RandomForestClassifier, AdaBoostClassifier and Logistics Regression to calculate the accuracy score, confusion matrix and the classification report. The results of the analysis are as follows:

##### Random Forest Classifier
 
![RandomForestClassifier](https://github.com/akhue02/final-project/blob/main/archive/Random_Forest.png)

##### AdaBoostClassifier

![AdaBoostClassifier](https://github.com/akhue02/final-project/blob/main/archive/AdaBoostClassifier.png)

##### Logistics Regression

![Logistics Regression](https://github.com/akhue02/final-project/blob/main/archive/LogisticsRegression.png)

#### Imbalance Check

![ScreenShot](https://github.com/akhue02/final-project/blob/main/archive/data%20imbalance%20check.png)



 ## Summary

 As part of the evaluation for this dataset, we carried out the analysis using three models that is RandomForestClassifier, LogisticsRegression and AdaBoostClassifier. Also, it is important to note that we did not carry out any Over and under sampling as the data was evenly divided among the More and Less risk patients. 
 
 ![Results Summary](https://github.com/akhue02/final-project/blob/main/archive/Overall_summary.png)

 Based on the analysis for the given dataset, we have achieved good Precision, Recall and F1 scores for all the models and the highest in this instance was for the RandomForestClassifier model. The most importance score is the Recall score for High risk that is 0.93 which showcases that we had a few wrongly diagnosed Actual High Risk cases which were Predicted low.
 

