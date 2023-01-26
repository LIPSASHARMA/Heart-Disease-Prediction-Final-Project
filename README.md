# final-project-

As part of the Data Exploration, the following steps were carried out:

## Data Preprocessing
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

 ![HeatMap]()

 ![Feature Importance]()

 * Further MinMaxScaler was used to scale the data and the data was split into training and testing. 


 ## Evaluation annd Testing

 * As part of the preliminary analysis, we used the RandomForestClassifier to calculate the accuracy score, confusion matrix an the classiication report. 

 ![Results]()
 



