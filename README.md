📊 PostgreSQL Employee Analytics Project
📌 Overview

This project is a SQL-first employee management and analytics system built using PostgreSQL.
It demonstrates strong fundamentals in database design, data cleaning, aggregation, and analytical querying, following industry best practices.

The goal of this project is to showcase:

Practical SQL skills (not toy examples)

Clean schema design

Data normalization & integrity

Analytical thinking using real-world queries

This project is intentionally backend-focused and is designed to be easily extended into a FastAPI / backend service.

🛠 Tech Stack

Database: PostgreSQL

Language: SQL

Tools: psql / pgAdmin

Version Control: Git & GitHub

🗂 Project Structure
postgresql_employee_project/
│
├── schema.sql        # Database schema, constraints, indexes
├── seed.sql          # Sample employee data
├── cleanup.sql       # Data normalization & cleanup queries
├── queries.sql       # Analytical and reporting queries
└── README.md         # Project documentation

🧱 Database Schema
employee table
Column	Type	Description
emp_id	SERIAL (PK)	Unique employee ID
first_name	VARCHAR	Employee first name
last_name	VARCHAR	Employee last name
email	VARCHAR (UNIQUE)	Employee email
dept	VARCHAR	Department name
salary	NUMERIC	Employee salary
hire_date	DATE	Date of joining
gender	ENUM	Gender (male, female, not specified)
employee_code	VARCHAR	Auto-generated employee code
full_name	VARCHAR	Concatenated full name
created_at	TIMESTAMP	Record creation time
Key Design Choices

ENUM for gender to enforce valid values

CHECK constraint on salary to prevent invalid data

Indexes on department, salary, email for performance

Normalized email storage using lowercase

🧪 Sample Data

The database is seeded with 15 realistic employee records across multiple departments:

IT

HR

Finance

Marketing

Salary, hire dates, and gender distributions are intentionally varied to support meaningful analytics.

🧹 Data Cleaning & Normalization

Implemented in cleanup.sql:

Trimmed whitespace from names

Converted all emails to lowercase

Generated full_name

Generated employee_code (Dept initial + zero-padded ID)

Ensured consistency across records

📈 Analytical Queries & Reports

Implemented in queries.sql:

🔹 Filtering & Search

Employees whose names start with a given letter

Salary range queries

Department-based filtering

Employees hired after a specific year

🔹 Aggregations

Employee count per department

Total & average salary per department

Departments with more than N employees

🔹 Advanced SQL

CASE expressions for salary band classification

Subqueries to find highest-paid employees per department

Window functions (ROW_NUMBER) for ranking

Year-wise hiring trends

Example: Top Earner per Department
SELECT emp_id, first_name, dept, salary
FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY dept ORDER BY salary DESC) AS rn
  FROM employee
) t
WHERE rn = 1;

🚀 How to Run Locally

Create a database

CREATE DATABASE employee_analytics;


Run schema

psql -d employee_analytics -f schema.sql


Insert data

psql -d employee_analytics -f seed.sql


Clean & normalize

psql -d employee_analytics -f cleanup.sql


Explore analytics

psql -d employee_analytics -f queries.sql

🎯 Skills Demonstrated

Relational database design

SQL CRUD operations

Data integrity using constraints

Aggregation & analytical queries

Window functions

Real-world reporting queries

Git-based project organization

📌 Why This Project Matters

Unlike basic SQL practice problems, this project:

Uses realistic data

Follows industry conventions

Separates schema, data, and analytics

Mirrors tasks performed in real backend/data roles

This makes it suitable for:

Internship interviews

Backend / SDE preparation

DBMS practical exams

FastAPI backend integration

🔮 Future Enhancements

Integrate with FastAPI for REST APIs

Add authentication & role-based access

Introduce foreign keys (departments table)

Add transaction handling

Performance tuning with EXPLAIN ANALYZE

👤 Author

Bhupender Nayak
Aspiring Software Engineer | Backend & Database Enthusiast
