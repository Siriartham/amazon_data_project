E-Commerce Dataset Cleaning and Optimization Using MySQL and Python

Project Overview

This project focuses on cleaning, validating, and optimizing a real-world e-commerce dataset using Python, Pandas, and MySQL. The dataset contained multiple structural inconsistencies, datatype issues, overwritten values, malformed records, and unreliable columns that affected analytical usability.

The project demonstrates practical data engineering concepts including:

Data preprocessing
Data cleaning
NULL value handling
Datatype standardization
Duplicate removal
Query validation
Database optimization
Indexing concepts
Technologies Used
Python
Pandas
NumPy
MySQL
MySQL Workbench
VS Code
GitHub
Project Workflow

Raw CSV Dataset ↓ Python Preprocessing ↓ MySQL Import ↓ Data Cleaning ↓ Validation ↓ Query Optimization ↓ Final Clean Dataset

Dataset Issues Identified
Missing unique identifier column
Overwritten and misaligned row values
Inconsistent delivery date formats
Semantically inconsistent shipment column
Mixed-content free_days column
Datatype inconsistencies in price columns
Missing and malformed values
Duplicate and corrupted records
Cleaning Operations Performed
Removed duplicate rows
Replaced corrupted values with NULL
Standardized numeric datatypes
Preserved product description metadata
Removed low-value shipment column
Validated pricing consistency
Cleaned malformed records
Final Cleaned Schema
product_description → TEXT
price_dollar → FLOAT
number_of_reviews → INT
real_price_dollar → FLOAT
free_days → TEXT
delivery_date → TEXT
Key Findings
Cleaned dataset produced more reliable query outputs.
Datatype correction improved analytical accuracy.
Indexing improved query retrieval efficiency.
Real-world datasets contain significant structural inconsistencies.
Future Improvements

Future improvements may include:

Automated anomaly detection
NLP-based product normalization
Scalable ETL pipeline development
Multi-dataset automation
Dashboard integration and visualization
Repository Structure

amazon_data_project/ │ ├── README.md ├── dataset/ ├── scripts/ │ └── import_data.py ├── reports/ │ └── cleaning_report.md ├── sql/ │ └── queries.sql └── screenshots/

How to Run
Install Python and MySQL.
Install required Python libraries:
pandas
mysql-connector-python
numpy
Configure MySQL database connection.
Run import_data.py.
Execute SQL queries for validation and optimization.

Author
Siri Artham
