<<<<<<< HEAD
# final-project
 
=======
# final-project-group-9 (Heart Disease Prediction)
## Purpose

The purpose of this project is to predict patients with high risk of heart disease

The term “heart disease” refers to several types of heart conditions. The most common type of heart disease is coronary artery disease (CAD), which affects the blood flow to the heart. Decreased blood flow can cause a heart attack.

### Attribute Information:

Age: age of the patient [years]

Sex: sex of the patient [M: Male, F: Female]

ChestPainType: chest pain type [TA: Typical Angina, ATA: Atypical Angina, NAP: Non-Anginal Pain, ASY: Asymptomatic]

RestingBP: resting blood pressure [mm Hg]

Cholesterol: serum cholesterol [mm/dl]

FastingBS: fasting blood sugar [1: if FastingBS > 120 mg/dl, 0: otherwise]

RestingECG: resting electrocardiogram results [Normal: Normal, ST: having ST-T wave abnormality (T wave inversions and/or ST elevation or depression of > 0.05 mV), LVH: showing probable or definite left ventricular hypertrophy by Estes' criteria]

MaxHR: maximum heart rate achieved [Numeric value between 60 and 202]

ExerciseAngina: exercise-induced angina [Y: Yes, N: No]

Oldpeak: oldpeak = ST [Numeric value measured in depression]

ST_Slope: the slope of the peak exercise ST segment [Up: upsloping, Flat: flat, Down: downsloping]

HeartDisease: output class [1: high risk, 0: low risk]

## Entity Relationship Diagram

The Entity Relationship Diagram is created based on the heart information of the patient. We have added a column "PatientID" to the dataset to have a primary key as none of the columns in the dataset had unique values.

![ScreenShot](https://github.com/akhue02/final-project-/blob/main/ERD_PostGresSQL_Snapshot.png)


### Tableau Link: https://public.tableau.com/app/profile/manish.thapa4247/viz/Heartrisk/HeartRisk_1?publish=yes

As part of the Data Exploration, the following steps were carried out:

### Data Preprocessing
  The following steps were taken:
  * File was checked for any null values/empty columns
   Features and Target variables were identified. For this project, the feature vairables were Age, Sex, ChestPainType, RestingBP, Cholesteroll, FastingBS, RestingECG, MaxHR,, ExerciseAngina, OldPeak, ST_Slope. Target variable was Heart Disease.
  * Object columns were identified and checked for any additional binning  requirements before conversion to numeric values using HotEncoder classifier.

   ```python
   # Generate the categorial variable lists
heart_cat=df.dtypes[df.dtypes=="object"].index.tolist()
df[heart_cat].nunique()
  ``` 

  * A HeatMap based on the corelation between various features and RandomForestClassifier was used to rank features based on their relevance. 

 ![HeatMap](https://github.com/akhue02/final-project-/blob/main/archive/HeatMap_feature.png)

 ![Feature Importance](https://github.com/akhue02/final-project-/blob/main/archive/Feature_relevance.png)

 * Features with relevance percentage less than 1% were dropped from the analysis. 

 ```python
# choosing the columns with relevance below 1%
least_importance_df=importance_df[importance_df["Relevance"]<0.01]
least_relevant=least_importance_df["Features"].tolist()
least_relevant
 ```

 * Further MinMaxScaler was used to scale the data and the data was split into training and testing. 


### Evaluation and Testing

  * As part of the preliminary analysis, we used the RandomForestClassifier to calculate the accuracy score, confusion matrix an the classiication report. 

 ![AccuracyScore](https://github.com/akhue02/final-project-/blob/main/archive/accuracy_score.png)

 ![Results](https://github.com/akhue02/final-project-/blob/main/archive/Results.png)

 ## Summary

 Based on the analysis, we achieved high Precisiion, Recall and F1 scores which showcases that the model has almost been successful to achieve its intended target of 95% confidence interval. In this instance, the most importance score is the Recall score for Highrisk which is 0.93 which showcases that we had few wrongly diagnosed Actual High Risk cases which were Predicted low. Further evaluation of the dataset and more model choices needs to be made to achiveing our target. 

