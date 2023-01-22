-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "PatientPersonalDetails" (
    "PatientID" int   NOT NULL,
    "Age" int   NOT NULL,
    "Sex" char   NOT NULL,
    CONSTRAINT "pk_PatientPersonalDetails" PRIMARY KEY (
        "PatientID"
     )
);

CREATE TABLE "PatientHeartInfo" (
    "PatientID" int   NOT NULL,
    "ChestPainType" varchar(20)   NOT NULL,
    "RestingBP" int   NOT NULL,
    "Cholesterol" int   NOT NULL,
    "FastingBS" boolean   NOT NULL,
    "RestingECG" varchar(20)   NOT NULL,
    "MaxHR" int   NOT NULL,
    "ExerciseAngina" char   NOT NULL,
    "Oldpeak" float   NOT NULL,
    "ST_Slope" varchar(20)   NOT NULL,
    "HeartDisease" boolean   NOT NULL
);

ALTER TABLE "PatientHeartInfo" ADD CONSTRAINT "fk_PatientHeartInfo_PatientID" FOREIGN KEY("PatientID")
REFERENCES "PatientPersonalDetails" ("PatientID");



CREATE TABLE PatientDetails (
	PatientID integer, 
	Age integer, 
	Sex char, 
	ChestPainType varchar(20), 
	RestingBP integer, 
	Cholesterol integer, 
	FastingBS boolean, 
	RestingECG varchar(20), 
	MaxHR integer, 
	ExerciseAngina char, 
	Oldpeak float, 
	ST_Slope varchar(20), 
	HeartDisease boolean);

COPY patientdetails(PatientID, Age, Sex, ChestPainType, RestingBP, Cholesterol, FastingBS, RestingECG, MaxHR, ExerciseAngina, Oldpeak, ST_Slope, HeartDisease)
FROM 'C:\\Users\\lipsa\\UoT-Data-Analytics\\final-project-\\archive\\heart.csv'
DELIMITER ','
CSV HEADER;


INSERT INTO public."PatientHeartInfo"("PatientID","ChestPainType","RestingBP","Cholesterol","FastingBS","RestingECG","MaxHR","ExerciseAngina","Oldpeak","ST_Slope","HeartDisease") 
	select PatientID,ChestPainType,RestingBP,Cholesterol,FastingBS,RestingECG,MaxHR,ExerciseAngina,Oldpeak,ST_Slope,HeartDisease from patientdetails;
	
	
INSERT INTO public."PatientPersonalDetails"("PatientID","Age","Sex") 
	select PatientID, Age, Sex from patientdetails;
