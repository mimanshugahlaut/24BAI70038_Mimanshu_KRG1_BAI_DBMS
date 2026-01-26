Experiment 2: Advanced Data Aggregation and Filtering

1. Aim of the Session

The objective of this experiment is to perform advanced data analysis in SQL using grouping and filtering techniques. The practical focuses on applying aggregate functions along with GROUP BY, HAVING, and ORDER BY clauses to analyze departmental salary data from an employee table.

2. Software Requirements:

   • Database: PostgreSQL Database (PgAdmin)
   
3. Objective of the Session

After completing this experiment, the following objectives were fulfilled:

•	Designed an employee database table using suitable data types such as NUMERIC and DATE. 

•	Applied aggregate functions to compute summary statistics on grouped records.

•	Understood the functional difference between WHERE (record-level filtering) and HAVING (group-level filtering).

•	Implemented sorting mechanisms on aggregated results using the ORDER BY clause.

4. Practical / Experiment Steps
   
The experiment was carried out through the following steps:

•	Table Design: Defined the structure of the employee table with appropriate constraints and precision for salary values.

•	Data Insertion: Added multiple employee records belonging to different departments such as IT, HR, Finance, and Sales.

•	Group-Based Calculation: Computed the average salary for each department using SQL aggregate functions.

•	Conditional Group Filtering: Used the HAVING clause to remove departments that did not satisfy the required average salary condition.

•	Combined Query Execution: Executed a single SQL query incorporating WHERE, GROUP BY, HAVING, and ORDER BY clauses for refined output.

5. Procedure of the Practical
   
The following procedure was adopted to perform the experiment:

•	Environment Setup: Logged into the PostgreSQL server using pgAdmin.

•	Table Creation: Executed the CREATE TABLE command to define the employee schema.

•	Data Population: Inserted sample employee records into the table.

•	Data Verification: Displayed table contents using SELECT * to ensure correctness.

•	Aggregation Execution: Applied GROUP BY to calculate department-wise average salaries.

•	Applying Filters: Used HAVING to select only departments with high average salaries.

•	Final Query Execution: Applied salary constraints using WHERE and sorted results using ORDER BY.

•	Documentation: Captured screenshots of outputs and saved the SQL script.

6. I/O Analysis (Input / Output Analysis)
   
Input Queries

SQL

-- Table creation

CREATE TABLE employee(

    emp_id NUMERIC PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary NUMERIC(10,2),
    joining_date DATE
)
-- Data Entry

INSERT INTO employee VALUES (101, 'Amit', 'IT', 19000, '2020-02-12');

INSERT INTO employee VALUES (102, 'Priya', 'HR', 22000, '2019-03-10');

INSERT INTO employee VALUES (103, 'Rahul', 'Sales', 35000, '2021-07-18');

INSERT INTO employee VALUES (104, 'Neha', 'IT', 55000, '2018-09-22');

INSERT INTO employee VALUES (105, 'Rohan', 'Finance', 32000, '2022-01-05');

INSERT INTO employee VALUES (106, 'Sara', 'Sales', 13000, '2020-12-03');

INSERT INTO employee VALUES (107, 'Vikram', 'HR', 12000, '2017-04-11');

SELECT * FROM employee

-- Advanced Aggregation Query

SELECT department, AVG(salary) AS avg_salary

FROM employee

GROUP BY department

SELECT department, AVG(salary) AS avg_salary

FROM employee

GROUP BY department

HAVING AVG(salary) > 30000


SELECT department, AVG(salary) AS avg_salary

FROM employee

WHERE salary > 20000

GROUP BY department

HAVING AVG(salary) > 30000

ORDER BY avg_salary DESC

Output Details

* Table Creation Output

The employee table was created successfully with the following attributes:

•	emp_id defined as PRIMARY KEY, ensuring unique identification.

•	salary stored with precision using NUMERIC(10,2).

•	joining_date stored using the DATE data type.

✔ No errors occurred during table creation.

* Data Insertion & Verification Output
<img width="742" height="396" alt="image" src="https://github.com/user-attachments/assets/9cdc21b3-6ab2-40c5-9521-17415ebc2a81" />
<img width="975" height="345" alt="image" src="https://github.com/user-attachments/assets/85922180-908c-45df-a8a3-93f513e0f725" />
                                
* Grouping Output (GROUP BY Clause) 
<img width="875" height="553" alt="image" src="https://github.com/user-attachments/assets/4968ae50-d1f3-456a-b91f-e8395183c065" />

* Group Filtering Output (HAVING Clause)
 <img width="856" height="481" alt="image" src="https://github.com/user-attachments/assets/5a5e7057-19ce-44de-8cbc-89a3406df7e1" />

* Combined Filtering & Sorting Output (WHERE + HAVING + ORDER BY)
 <img width="872" height="608" alt="image" src="https://github.com/user-attachments/assets/2210b4bc-5374-468e-9420-12bf5a2f7644" />


7. Learning Outcome
   
•	Learned to use aggregate functions like AVG() for data analysis.

•	Understood how GROUP BY organizes data into meaningful groups.

•	Differentiated between WHERE and HAVING clauses.

•	Practiced filtering and sorting results using HAVING and ORDER BY.

•	Gained hands-on experience in analyzing real-world employee salary data.

