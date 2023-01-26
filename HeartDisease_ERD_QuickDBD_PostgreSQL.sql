-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

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
    CONSTRAINT "pk_PatientHeartInfo" PRIMARY KEY (
        "PatientID"
     )
);

CREATE TABLE "PatientHeartDiseaseOutput" (
    "PatientID" int   NOT NULL,
    "HeartDisease" boolean   NOT NULL,
    CONSTRAINT "pk_PatientHeartDiseaseOutput" PRIMARY KEY (
        "PatientID"
     )
);

ALTER TABLE "PatientHeartInfo" ADD CONSTRAINT "fk_PatientHeartInfo_PatientID" FOREIGN KEY("PatientID")
REFERENCES "PatientPersonalDetails" ("PatientID");

ALTER TABLE "PatientHeartDiseaseOutput" ADD CONSTRAINT "fk_PatientHeartDiseaseOutput_PatientID" FOREIGN KEY("PatientID")
REFERENCES "PatientPersonalDetails" ("PatientID");

