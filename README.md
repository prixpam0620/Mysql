# Mysql
EDA on sample superstore dataset using mysql workbench
# MySQL Superstore Analysis Project

## Overview
This project analyzes the **Sample Superstore** dataset using MySQL. The dataset, sourced from Kaggle, contains sales, profit, customer, and product data for a fictional superstore. The goal is to clean the data, perform exploratory analysis, and derive business insights. This repository includes the raw dataset and SQL scripts used for the analysis.

## Repository Structure
- **`Sample_Superstore_Cleaned_UTF8`**: The original dataset has 9990 approx rows and 21 columns whilst this cleaned dataset has (4,929 rows, 21 columns) downloaded from Kaggle and imported into MySQL.
- **`Samplesuperstore_analysis`**: SQL script containing data cleaning and analysis queries executed in MySQL Workbench.
- **`README.md`**: This file, providing project details and instructions.

## Dataset Description
- **Source**: Kaggle (Sample Superstore dataset).
- **Rows**: 4,929 (after cleaning duplicates).
- **Columns**: 21, including:
  - `row_id` (INT): Unique row identifier (added during import).
  - `order_id` (VARCHAR): Unique order identifier.
  - `order_date` (DATE): Date of the order.
  - `ship_date` (DATE): Date of shipment.
  - `ship_mode` (VARCHAR): Shipping method (e.g., Standard Class).
  - `customer_id` (VARCHAR): Unique customer identifier.
  - `customer_name` (VARCHAR): Customer name.
  - `segment` (VARCHAR): Customer segment (e.g., Consumer).
  - `country` (VARCHAR): Country of sale.
  - `city` (VARCHAR): City of sale.
  - `state` (VARCHAR): State of sale.
  - `postal_code` (VARCHAR): Postal code.
  - `region` (VARCHAR): Region (e.g., West).
  - `product_id` (VARCHAR): Unique product identifier.
  - `category` (VARCHAR): Product category (e.g., Technology).
  - `sub_category` (VARCHAR): Product sub-category (e.g., Phones).
  - `product_name` (VARCHAR): Product name.
  - `sales` (DECIMAL): Sales amount.
  - `quantity` (INT): Quantity sold.
  - `discount` (DECIMAL): Discount applied.
  - `profit` (DECIMAL): Profit earned.

## Prerequisites
- **MySQL**: Version 5.7 or higher.
- **MySQL Workbench**: For running SQL scripts (optional).
- **Disk Space**: ~10MB for the CSV and database.

## Setup Instructions
Follow these steps to replicate the project:

### 1. Create the Database and Table
Since the original database creation commands were not saved, use the script below in MySQL Workbench or the MySQL command line:

```sql
-- Create the database
CREATE DATABASE superstore;
USE superstore;

-- Create the table (adjust column lengths/types if needed)
CREATE TABLE store (
    row_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(20),
    customer_id VARCHAR(20),
    customer_name VARCHAR(50),
    segment VARCHAR(20),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(10),
    region VARCHAR(20),
    product_id VARCHAR(20),
    category VARCHAR(30),
    sub_category VARCHAR(30),
    product_name VARCHAR(100),
    sales DECIMAL(10, 2),
    quantity INT,
    discount DECIMAL(5, 2),
    profit DECIMAL(10, 2)
);
Stepes to create database and tables:
CREATE DATABASE SUPERSTORE;
USE SUPERSTORE;
CREATE TABLE STORE;

hence, database and table created.
we will use superstore.store for our queries in the SQL file.

Analysis Highlights
Data Cleaning: Removed duplicate order_id entries, keeping the lowest row_id.
Insights:
Customer order frequency by segment and region.
Profit and sales trends by category, sub-category, and time (monthly/yearly).
Geographic performance (e.g., customer counts by city/state).
Shipping efficiency (average days between order and ship dates).
Usage
Run individual queries from queries.sql to explore specific aspects (e.g., top profitable customers).
Modify queries to suit your business questions (e.g., filter by specific regions).
Notes
Missing Creation Commands: The original CREATE TABLE wasn’t saved from MySQL Workbench. The script above recreates it based on the dataset structure.
File Size: The CSV is ~5-10MB, well under GitHub’s 100MB limit.
License: The dataset is from Kaggle and assumed to be public domain (verify Kaggle’s terms).
Contributing
Feel free to fork this repository, enhance the queries, or suggest improvements via pull requests!

Contact
For questions, open an issue on this GitHub repository.

