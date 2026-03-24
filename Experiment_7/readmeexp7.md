Experiment 7: Create and Analyze Views

1. Aim of the Session

        To design and implement a materialised view and to compare and analyse execution time and performance differences between simple views, complex views, and materialized views, thereby understanding their impact on query optimization and system performance.

2. Software Requirements:

        •	Database Management System:
            o	Oracle Database Express Edition (Oracle XE)
            o	PostgreSQL Database
        •	Database Administration Tool / Client Tool:
            o	Oracle SQL Developer (for Oracle XE)
            o	pgAdmin (for PostgreSQL)

3. Objective of the Session

        To create simple views, complex views, and materialized views, and to evaluate their performance by comparing query execution time for each, highlighting the advantages of materialized views in enterprise-level applications.

4. Practical / Experiment Steps

        The work was carried out through the following activities:
        1.	Database Design: Created two related tables (departments and employees) with proper primary and foreign key constraints.
        2.	Basic View Creation: Developed a simple view (V_BASIC) to display employees with salaries above a certain limit.
        3.	Advanced View Development: Constructed a complex view (V_ADVANCED) using joins and aggregation functions like SUM() and AVG() to analyze department-wise salaries.
        4.	Materialized View Setup: Created a materialized view (V_STORE) to store precomputed results for faster data retrieval.
        5.	Performance Evaluation: Used query analysis tools such as EXPLAIN ANALYZE to compare execution time of different views.
        6.	Data Synchronization: Applied refresh operations to update the materialized view after changes in base tables.

5. Procedure of the Practical

        Execution was performed in the following order:
        •	Connected to the PostgreSQL/Oracle database using the appropriate client tool.
        •	Created departments and employees tables and inserted sample data.
        •	Defined a simple view to filter employees based on salary conditions.
        •	Built a complex view using JOIN and GROUP BY to calculate department-wise salary statistics.
        •	Created a materialized view using the same query to store results physically.
        •	Performed updates on base tables and refreshed the materialized view.
        •	Executed EXPLAIN ANALYZE on all views to compare performance.
        •	Observed differences in execution time and efficiency.
        •	Documented results and conclusions.

6. I/O Analysis (Input / Output Analysis)

SQL

    CREATE TABLE departments(
        dept_id INT PRIMARY KEY,
        dept_name VARCHAR(25)
    );
    
    CREATE TABLE employees(
        emp_id INT PRIMARY KEY,
        emp_name VARCHAR(25),
        dept_id INT REFERENCES departments(dept_id),
        salary NUMERIC
    );

<img width="311" height="275" alt="Screenshot 2026-03-25 021313" src="https://github.com/user-attachments/assets/55efc54f-06ad-4bda-a2cc-617ab79671b1" />

    INSERT INTO departments VALUES (1, 'IT'), (2, 'Finance'), (3, 'Marketing');
    
    INSERT INTO employees VALUES (201, 'Rahul', 1, 90000);
    INSERT INTO employees VALUES (202, 'Neha', 2, 60000);
    INSERT INTO employees VALUES (203, 'Karan', 1, 85000);
    INSERT INTO employees VALUES (204, 'Simran', 3, 50000);

 <img width="464" height="189" alt="Screenshot 2026-03-25 021347" src="https://github.com/user-attachments/assets/24129774-9eb6-4377-8fe7-95975f7ba882" />

    --Simple View--
    CREATE VIEW V_BASIC AS
    SELECT emp_name, salary FROM employees WHERE salary > 70000;
    
    SELECT * FROM V_BASIC;
 
 <img width="410" height="167" alt="Screenshot 2026-03-25 021443" src="https://github.com/user-attachments/assets/b2ffe8e5-80eb-43f0-b784-47eea06da757" />

    --Complex View--
    CREATE VIEW V_ADVANCED AS
    SELECT d.dept_name, SUM(e.salary) AS total_salary, AVG(e.salary) AS avg_salary
    FROM employees e JOIN departments d
    ON e.dept_id = d.dept_id
    GROUP BY d.dept_name;
    
    SELECT * FROM V_ADVANCED;

 <img width="475" height="235" alt="Screenshot 2026-03-25 021514" src="https://github.com/user-attachments/assets/f99e7f88-3c18-4357-8ec2-ba6aa528cf45" />

    --Materialized View--
    CREATE MATERIALIZED VIEW V_STORE AS
    SELECT d.dept_name, SUM(e.salary) AS total_salary, AVG(e.salary) AS avg_salary
    FROM employees e JOIN departments d
    ON e.dept_id = d.dept_id
    GROUP BY d.dept_name;
    
    SELECT * FROM V_STORE;

 <img width="464" height="217" alt="Screenshot 2026-03-25 021546" src="https://github.com/user-attachments/assets/42e3ddf2-8bf5-483e-9c13-b7506e27eaff" />

    --Refresh--
    REFRESH MATERIALIZED VIEW V_STORE;

 <img width="280" height="114" alt="Screenshot 2026-03-25 021619" src="https://github.com/user-attachments/assets/462894c9-c7de-429f-b6e4-6606c6725a2d" />

    --Performance Check--
    EXPLAIN ANALYZE SELECT * FROM V_BASIC;

 <img width="439" height="217" alt="Screenshot 2026-03-25 021854" src="https://github.com/user-attachments/assets/6ef4e78d-e60b-4ad5-9b8d-116e3fc72c6d" />

    EXPLAIN ANALYZE SELECT * FROM V_ADVANCED;

 <img width="548" height="350" alt="Screenshot 2026-03-25 021943" src="https://github.com/user-attachments/assets/a4976fe6-cc86-433f-a738-4325096e8a26" />

    EXPLAIN ANALYZE SELECT * FROM V_STORE;

 <img width="419" height="161" alt="Screenshot 2026-03-25 022007" src="https://github.com/user-attachments/assets/abf710b6-a71c-4eb7-96fa-82994d9a1190" />

7. Learning Outcome

        • Learned the difference between simple, complex, and materialized views. 
        • Understood how materialized views improve performance. 
        • Gained knowledge of query analysis using EXPLAIN ANALYZE. 
        • Learned how to refresh and manage stored views.
