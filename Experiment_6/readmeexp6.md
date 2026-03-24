Experiment 6: Working of Cursor in PL/SQL

1. Aim of the Session

        To understand the concept and working of cursors in PL/SQL for row-by-row data processing, and to analyse how implicit cursors, explicit cursors, and cursor attributes are used to implement business logic on multiple rows in a database table.

2. Software Requirements:

        •	Database Management System:
            o	Oracle Database Express Edition (Oracle XE)
            o	PostgreSQL Database
        •	Database Administration Tool / Client Tool:
            o	Oracle SQL Developer (for Oracle XE)
            o	pgAdmin (for PostgreSQL)

3. Objective of the Session

        To implement and analyse the use of implicit cursors, explicit cursors, and cursor attributes for processing multiple rows from a database table and applying business logic effectively. 

4. Practical / Experiment Steps

        The work was carried out through the following activities:
        1.	Schema Creation: Created the Employees table with attributes such as Employee ID, Name, Role, and Salary to represent a structured organizational database.
        2.	Data Initialization: Inserted multiple employee records with different roles and salary values to prepare a dataset for cursor operations.
        3.	Implicit Cursor Implementation: Executed an anonymous PL/SQL block to perform an UPDATE operation on employee salary and used implicit cursor attributes like SQL%ROWCOUNT to verify execution.
        4.	Explicit Cursor Declaration: Defined a named cursor (c_emp) to retrieve records of employees based on a specific condition (e.g., role = 'Engineer') for controlled row-wise processing.
        5.	Cursor Attribute Utilization: Applied cursor attributes such as %FOUND, %NOTFOUND, %ROWCOUNT, and %ISOPEN to manage program flow and monitor cursor behavior.
        6.	Logical Processing: Implemented business logic to process employee records individually, such as updating salaries or displaying formatted output.

5. Procedure of the Practical

        Execution was performed in the following order:
        •	Opened the Oracle database environment (SQL*Plus / SQL Developer) and enabled SERVEROUTPUT to display results.
        •	Executed CREATE TABLE and INSERT statements to establish the Employees dataset.
        •	Ran a PL/SQL block using an implicit cursor to update a selected employee’s salary and verified the result using SQL%ROWCOUNT.
        •	Declared an explicit cursor (c_emp) to select employees based on a specific role condition.
        •	Opened the cursor and confirmed its status using the %ISOPEN attribute.
        •	Used a LOOP structure to fetch records sequentially into variables (e.g., v_name, v_salary).
        •	Applied %NOTFOUND as the exit condition to terminate the loop after all records were processed.
        •	Tracked the number of processed rows using %ROWCOUNT during iteration.
        •	Closed the cursor explicitly to release system resources and verified closure using NOT c_emp%ISOPEN.

6. I/O Analysis (Input / Output Analysis)

SQL

    CREATE TABLE Employees(
        emp_id NUMBER PRIMARY KEY,
        emp_name VARCHAR(25),
        emp_role VARCHAR(20),
        emp_salary NUMBER
    );

  <img width="237" height="296" alt="Screenshot 2026-03-25 012600" src="https://github.com/user-attachments/assets/dc8c95bf-14ff-4279-a10e-6acf3b515c34" />

    INSERT INTO Employees VALUES (201, 'Rahul', 'Engineer', 80000);
    INSERT INTO Employees VALUES (202, 'Neha', 'Manager', 95000);
    INSERT INTO Employees VALUES (203, 'Arjun', 'Engineer', 87000);
    INSERT INTO Employees VALUES (204, 'Priya', 'Analyst', 50000);

  <img width="382" height="346" alt="Screenshot 2026-03-25 012704" src="https://github.com/user-attachments/assets/002c6309-b0ac-4893-96f9-53a1b80c4828" />

    SET SERVEROUTPUT ON;
    
    DECLARE
        v_emp_id NUMBER := 201;
    BEGIN
        UPDATE Employees
        SET emp_salary = emp_salary * 1.15
        WHERE emp_id = v_emp_id;
    
        IF SQL%FOUND THEN
            DBMS_OUTPUT.PUT_LINE('SQL%FOUND = TRUE');
            DBMS_OUTPUT.PUT_LINE('Rows affected: ' || SQL%ROWCOUNT);
        ELSE
            DBMS_OUTPUT.PUT_LINE('No matching record found');
        END IF;
    END;

  <img width="364" height="383" alt="Screenshot 2026-03-25 012958" src="https://github.com/user-attachments/assets/37ffc8e1-9eee-47ca-bebf-1b07fa947e7b" />

    DECLARE
        CURSOR c_emp IS
            SELECT emp_name, emp_role
            FROM Employees
            WHERE emp_role = 'Engineer';
    
        v_name Employees.emp_name%TYPE;
        v_role Employees.emp_role%TYPE;
    BEGIN
        OPEN c_emp;
        IF c_emp%ISOPEN THEN
            DBMS_OUTPUT.PUT_LINE('Cursor opened successfully');
        END IF;
        LOOP
            FETCH c_emp INTO v_name, v_role;
            IF c_emp%NOTFOUND THEN
                DBMS_OUTPUT.PUT_LINE('No more records found');
                EXIT;
            END IF;
            DBMS_OUTPUT.PUT_LINE('Engineer #' || c_emp%ROWCOUNT || 
                                 ': ' || v_name || ' | ' || v_role);
        END LOOP;
        CLOSE c_emp;
        IF NOT c_emp%ISOPEN THEN
            DBMS_OUTPUT.PUT_LINE('Cursor closed successfully');
        END IF;
    END;

  <img width="311" height="434" alt="Screenshot 2026-03-25 013128" src="https://github.com/user-attachments/assets/9815dccd-dc53-4a1f-84ae-9929ddadb185" />

 
7. Learning Outcome

        • Learned how to use implicit and explicit cursors in PL/SQL. 
        • Understood cursor attributes like SQL%ROWCOUNT, %FOUND, %NOTFOUND, and %ISOPEN. 
        • Gained ability to process records row-by-row using cursors. 
        • Applied simple logic on database records (update and display).
