# Agricultural Yield Analysis using Snowflake and Power BI

## 📌 Project Overview
This project demonstrates an end-to-end analytics workflow using **Snowflake** as a cloud data warehouse and **Power BI** for data visualization and dashboarding.

The goal of the project is to analyze agricultural yield data across multiple dimensions such as **year, season, crop type, rainfall, temperature, humidity, and location**, and present insights through interactive dashboards.

---

## 🖼️ Sample Dashboard – Yield Analysis

Below is a sample view of the Yield Analysis report page:
🔗 [View Dashboard(Google Drive)](https://drive.google.com/file/d/1gJtYTKPUUlT28AxNj715a6lWM_fjPA_W/view?usp=drive_link)

🔗 [Dashboard Walkthrough (Google Drive)](https://drive.google.com/file/d/1qyqJzAYabnCBb9ESjjrPHR7nDodvML-v/view?usp=drive_link)

---

## ⚠️ Disclaimer
This project follows an industry-style architecture where data is typically ingested from cloud storage (AWS S3) into Snowflake before being consumed by BI tools such as Power BI.

To avoid unnecessary cloud billing risks during learning, the AWS ingestion layer was **not implemented practically**. Instead, data was directly loaded into Snowflake using Snowflake’s **internal staging and data loading capabilities**.

The complete AWS-to-Snowflake ingestion process, including S3 bucket creation, file upload, IAM role creation, and integration concepts, has been **fully documented** to demonstrate conceptual understanding of the end-to-end data pipeline.

**Documented Architecture:**  
AWS S3 → Snowflake → Power BI  

**Implemented Architecture:**  
Local CSV → Snowflake → Power BI  

---

## 🛠️ Tech Stack
- Snowflake (Cloud Data Warehouse)
- Power BI (Data Visualization)
- SQL (Data Transformation)
- CSV Dataset

---

## 🏗️ Project Architecture
Local CSV file is ingested into Snowflake using internal staging, transformed using SQL, and visualized in Power BI.

Local CSV → Snowflake → Power BI

---

## 📂 Data Modeling in Snowflake

### Database and Schema
```sql
CREATE OR REPLACE DATABASE PowerBI;
USE DATABASE PowerBI;

CREATE SCHEMA PBI_Data;
USE SCHEMA PBI_Data;
```

### Target Table
```sql
CREATE TABLE PBI_Dataset (
    Year INT,
    Location STRING,
    Area INT,
    Rainfall FLOAT,
    Temperature FLOAT,
    Soil_type STRING,
    Irrigation STRING,
    Yields INT,
    Humidity FLOAT,
    Crops STRING,
    Price INT,
    Season STRING
);
```
---

## 📥 Data Loading

Data was loaded directly into Snowflake using Snowflake UI internal staging.

**Steps:**

- Navigate to Databases → PowerBI → PBI_Data → Tables
- Select the table PBI_Dataset
- Click Load Data
- Upload the CSV file
- Snowflake automatically detects the file format and loads the data

---

## 🔄 Data Transformation using Snowflake SQL

A replica table was created to safely apply transformations.
**Transformations Performed**
- Increased rainfall values by 10%
- Reduced area values by 10%
- Grouped years into logical buckets
- Categorized rainfall into Low, Mid, and High

---

## 🎯 Key Learnings

- Snowflake database and schema design

- Internal staging and data ingestion

- SQL-based data transformations

- BI-friendly analytics modeling

- Power BI integration with Snowflake

- Real-world analytics workflow
