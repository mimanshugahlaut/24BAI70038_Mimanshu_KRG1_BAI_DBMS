Experiment 5: SQL Conditional Logic

1. Aim of the Session

       To understand and apply conditional logic in SQL by using the modulus operator (MOD / %) to analyse numerical data and classify employee salaries as odd or even, thereby improving data analysis and decision-making skills in SQL.

3. Software Requirements:

        •	Database Management System:
            o	Oracle Database Express Edition (Oracle XE)
            o	PostgreSQL Database
        •	Database Administration Tool / Client Tool:
            o	Oracle SQL Developer (for Oracle XE)
            o	pgAdmin (for PostgreSQL)
3. Objective of the Session
   
        To write and execute SQL queries that use the MOD (%) operator to check employee salaries and display odd and even salary values separately from an employee table.

4. Practical / Experiment Steps
   
The work was carried out through the following activities:

    1.	Table Structure Creation: Created an Employee table in the database containing attributes such as Employee ID, Name, and Salary to store employee information.
    2.	Data Insertion: Inserted multiple employee records with different salary values into the Employee table to create sample data for analysis.
    3.	Use of MOD Operator: Applied the MOD (%) operator in SQL queries to determine whether the salary values are odd or even.
    4.	Conditional Query Execution: Wrote SQL queries using the WHERE clause along with the MOD (%) operator to filter and display employees with odd and even salaries separately.
    5.	Result Verification: Executed the queries and verified that the results correctly classified employee salaries as odd or even based on the modulus condition.

5. Procedure of the Practical
   
Execution was performed in the following order:

      1.	Environment Initialization: Opened the Oracle SQL environment (SQL*Plus / SQL Developer) and connected to the database server.
      2.	Table Creation: Created an Employee table with appropriate attributes such as Employee ID, Name, and Salary to store employee information.
      3.	Data Insertion: Inserted sample employee records into the Employee table with different salary values for testing and analysis.
      4.	Query Preparation: Wrote SQL queries using the MOD (%) operator to check whether the salary values are odd or even.
      5.	Conditional Filtering: Applied the WHERE clause along with the MOD operator to retrieve employees with even salaries.
      6.	Odd Salary Query Execution: Executed another query using the MOD operator to retrieve employees with odd salaries.
      7.	Query Execution: Ran the SQL statements in the SQL environment to process the queries.
      8.	Result Verification: Verified the output to ensure that salaries were correctly classified as odd or even based on the modulus condition.
      9.	Documentation: Saved the SQL queries and recorded the output results for documentation and submission.
      
6. I/O Analysis (Input / Output Analysis)
   
Input Queries
SQL

    CREATE TABLE employees(
    	emp_id INT PRIMARY KEY,
    	emp_name VARCHAR(20),
    	emp_sal INT
    );
    
    INSERT INTO employees VALUES(1,'Harry',13000);
    INSERT INTO employees VALUES(2,'Ron',18907);
    INSERT INTO employees VALUES(3,'John',18000);
    INSERT INTO employees VALUES(4,'Peter',29001);
    INSERT INTO employees VALUES(5,'Stephen',16000);
    
    SELECT *,
    CASE 
    	WHEN emp_sal % 2=0 THEN 'Even Salary'
    	ELSE 'Odd Salary'
    END AS salary_type
    FROM employees; 

Output Details

<img width="757" height="408" alt="image" src="https://github.com/user-attachments/assets/f2501b44-9e86-4bd3-8b56-f7ce6ca91d05" />

 
7. Learning Outcome
   
        •	Learned how to use the MOD (%) operator in SQL.
        •	Understood how to perform conditional filtering on numeric data.
        •	Gained practical experience in writing SQL queries for data analysis.
        •	Learned to classify data into categories such as odd and even values.
        •	Improved skills in SQL query execution and result interpretation.
