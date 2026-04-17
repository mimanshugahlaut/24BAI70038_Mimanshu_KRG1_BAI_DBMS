Experiment 9: Packages in PL/SQL

1. Aim of the Session

        To design and implement PL/SQL packages by creating both the package specification and package body, incorporating procedures and shared cursors to support modular, reusable, and efficient database operations.

2. Software Requirements:

        •	Database Management System:
            o	Oracle Database Express Edition (Oracle XE)
            o	PostgreSQL Database
        •	Database Administration Tool / Client Tool:
            o	Oracle SQL Developer (for Oracle XE)
            o	pgAdmin (for PostgreSQL)

3. Objective of the Session

        To develop a PL/SQL package that includes procedures and shared cursors for organized and modular programming.

4. Practical / Experiment Steps

        The work was carried out through the following activities:
        1.	Design of Modular Structure: Divided the database logic into a package consisting of a specification (interface) and a body (implementation).
        2.	Shared Cursor Definition: Created a common cursor within the package body to allow multiple procedures to access the same dataset efficiently.
        3.	Procedure Implementation: Developed procedures for handling different operations such as displaying all records and retrieving specific entries.
        4.	Encapsulation Mechanism: Restricted direct access to internal logic by exposing only the required procedures through the package interface.
        5.	Testing and Validation: Executed the procedures within anonymous blocks to ensure correct functionality and consistency.

5. Procedure of the Practical

        Execution was performed in the following order:
        • Connected to the database environment and enabled output display for verification.
        • Created the employees table and inserted sample data for testing purposes.
        • Defined the package specification (emp_package) to declare the available procedures.
        • Implemented the package body containing the shared cursor and the logic for each procedure.
        • Used a loop structure in the show_employees procedure to iterate through all records using the cursor.
        • Implemented filtering logic in the get_employee procedure to retrieve details based on a given employee ID.
        • Compiled both the specification and body to ensure error-free execution.
        • Executed show_employees to display all records.
        • Called get_employee(2) to verify retrieval of a specific record.

6. I/O Analysis (Input / Output Analysis)
Input Queries
SQL

        CREATE TABLE emp_data (
            id NUMBER PRIMARY KEY,
            name VARCHAR2(50),
            salary NUMBER
        );
        /
<img width="146" height="142" alt="Screenshot 2026-04-18 005031" src="https://github.com/user-attachments/assets/142c972f-0b8e-4a52-a690-af360b7ed56a" />


        INSERT INTO emp_data VALUES (1, 'Amit', 30000);
        INSERT INTO emp_data VALUES (2, 'Riya', 40000);
        INSERT INTO emp_data VALUES (3, 'John', 50000);
        
        COMMIT;
        /
<img width="227" height="275" alt="Screenshot 2026-04-18 005135" src="https://github.com/user-attachments/assets/bc140b0d-80b0-42c6-b575-6fa22f6a6839" />


        CREATE OR REPLACE PACKAGE employee_pkg AS
        
            -- Display all employee records
            PROCEDURE display_all;
        
            -- Fetch employee by ID
            PROCEDURE find_employee(p_emp_id NUMBER);
        
        END employee_pkg;
        /
<img width="197" height="110" alt="Screenshot 2026-04-18 005217" src="https://github.com/user-attachments/assets/941fd671-53b9-49ed-a30d-4ef93dff1c57" />


        CREATE OR REPLACE PACKAGE BODY employee_pkg AS
        
            -- Shared cursor
            CURSOR emp_cur IS
                SELECT id, name, salary FROM emp_data;
        
            -- Procedure to display all records
            PROCEDURE display_all IS
            BEGIN
                FOR rec IN emp_cur LOOP
                    DBMS_OUTPUT.PUT_LINE(
                        'ID: ' || rec.id ||
                        ', Name: ' || rec.name ||
                        ', Salary: ' || rec.salary
                    );
                END LOOP;
            END;
        
            -- Procedure to fetch specific employee
            PROCEDURE find_employee(p_emp_id NUMBER) IS
            BEGIN
                FOR rec IN emp_cur LOOP
                    IF rec.id = p_emp_id THEN
                        DBMS_OUTPUT.PUT_LINE(
                            'Employee Details -> ID: ' || rec.id ||
                            ', Name: ' || rec.name ||
                            ', Salary: ' || rec.salary
                        );
                    END IF;
                END LOOP;
            END;
        
        END employee_pkg;
        /
<img width="211" height="107" alt="Screenshot 2026-04-18 005311" src="https://github.com/user-attachments/assets/8a329dbd-6007-442d-a62b-89e57eb6fede" />


        SET SERVEROUTPUT ON;
        
        BEGIN
            employee_pkg.display_all;
        END;
        /
<img width="238" height="129" alt="Screenshot 2026-04-18 005347" src="https://github.com/user-attachments/assets/9d8b055f-68b5-4900-9b74-e78faedbe253" />


        BEGIN
            employee_pkg.find_employee(2);
        END;
        /
<img width="209" height="101" alt="Screenshot 2026-04-18 005449" src="https://github.com/user-attachments/assets/0ae1f82c-0f56-488f-9006-f5ea06317002" />


7. Learning Outcome

        •	Understanding Package Structure: Learned the distinction between package specification and package body.
        •	Improved Code Organization: Gained knowledge of grouping related operations into a single unit for better maintainability.
        •	Efficient Data Handling: Understood how shared cursors help in reducing redundancy and improving performance.
        •	Encapsulation Concept: Learned how packages hide internal implementation details and provide a clean interface.
