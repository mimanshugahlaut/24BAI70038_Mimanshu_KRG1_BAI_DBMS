Experiment 8: Stored Procedures
1. Aim of the Session

        To understand the design and implementation of stored procedures in PL/SQL, focusing on the use of different parameter modes (IN, OUT, and INOUT) to encapsulate business logic and facilitate modular programming within a database.

2. Software Requirements:

        •	Database Management System:
            o	Oracle Database Express Edition (Oracle XE)
            o	PostgreSQL Database
        •	Database Administration Tool / Client Tool:
            o	Oracle SQL Developer (for Oracle XE)
            o	pgAdmin (for PostgreSQL)

3. Objective of the Session

        To create and execute a parameterized stored procedure that processes data from an employee table, utilizes multiple parameter types to return calculated results and execution status, and demonstrates the invocation of procedures using anonymous blocks.

4. Practical / Experiment Steps
The work was carried out through the following activities:

        1.	Table Creation: Created an employees table with fields such as employee ID, name, gender, and salary.
        2.	Procedure Development: Implemented a stored procedure named count_employees_by_gender.
        3.	Parameter Handling: Used IN parameter for input (gender), OUT parameter for returning count, and INOUT parameter for status tracking.
        4.	Query Integration: Applied SELECT COUNT(*) INTO to fetch filtered results.
        5.	Execution Block: Used an anonymous block to call the procedure and display results.

5. Procedure of the Practical
Execution was performed in the following order:

        • Connected to the PostgreSQL database environment.
        • Created and populated the employees table with sample data.
        • Defined a stored procedure with appropriate parameter modes.
        • Wrote logic to count employees based on gender.
        • Updated the status parameter to indicate successful execution.
        • Declared variables inside an anonymous block.
        • Called the procedure using the CALL statement.
        • Displayed output using RAISE NOTICE.
        • Verified results with actual table data.
	
6. I/O Analysis (Input / Output Analysis)
Input Queries
SQL

        CREATE TABLE employe(
        	emp_id INT PRIMARY KEY,
        	emp_name VARCHAR(20),
        	gender VARCHAR(20),
        	salary NUMERIC(10, 2)
        );
 <img width="235" height="167" alt="Screenshot 2026-03-28 192908" src="https://github.com/user-attachments/assets/62136abb-1df0-427d-9c15-3e092e1d643f" />


        INSERT INTO employe (emp_id, emp_name, gender, salary) VALUES
        (101, 'Amitabh', 'Male', 30000),
        (102, 'Annu', 'Female', 55000),
        (103, 'Riya', 'Female', 45000),
        (104, 'Amrit', 'Male', 59000),
        (105, 'Anjali', 'Female', 66000);
 <img width="383" height="165" alt="Screenshot 2026-03-28 192937" src="https://github.com/user-attachments/assets/85d0be80-4505-423b-be18-7ba7cbca46b9" />


        CREATE OR REPLACE PROCEDURE get_employe_count_by_gender (
            IN IN_GENDER VARCHAR(20),
            OUT OUT_COUNT INT,
            INOUT STATUS VARCHAR(20)
        )
        AS
        $$
        BEGIN
            SELECT COUNT(*) INTO OUT_COUNT 
            FROM employe 
            WHERE gender = IN_GENDER;
        
            STATUS := 'SUCCESS';
        END;
        $$ LANGUAGE PLPGSQL;
 <img width="341" height="266" alt="Screenshot 2026-03-28 194717" src="https://github.com/user-attachments/assets/49e262f2-f9f0-4281-ab95-d63fd5e73c04" />


        DO
        $$
        DECLARE
            GEN VARCHAR(20) := 'Female';
            COUNT_OF_EMPLOYE INT;
            STATUS VARCHAR := 'PENDING';
        
        BEGIN
            CALL get_employe_count_by_gender(GEN, COUNT_OF_EMPLOYE, STATUS);
        
            RAISE NOTICE 'COUNT OF % EMPLOYEES IS % AND STATUS IS %',
            GEN, COUNT_OF_EMPLOYE, STATUS;
        END;
        $$
 <img width="398" height="261" alt="Screenshot 2026-03-28 194745" src="https://github.com/user-attachments/assets/ad1d5598-fff4-401d-8c1c-0cb78a285b17" />


7. Learning Outcome
   
        •	Understood how to encapsulate SQL logic into reusable procedures.
        •	Learned the use of IN, OUT, and INOUT parameters in stored procedures.
        •	Gained knowledge of using SELECT INTO for assigning query results.
        •	Learned how to display output using RAISE NOTICE.
