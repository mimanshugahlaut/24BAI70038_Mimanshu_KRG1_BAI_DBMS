Experiment 10: Trigger

1. Aim of the Session

        To design a trigger that automatically implements the functionality of a primary key, ensuring unique identification of records without manual intervention.

2. Software Requirements:

        •	Database Management System:
            o	Oracle Database Express Edition (Oracle XE)
            o	PostgreSQL Database
        •	Database Administration Tool / Client Tool:
            o	Oracle SQL Developer (for Oracle XE)
            o	pgAdmin (for PostgreSQL)

3. Objective of the Session

        To create a database trigger that automatically enforces primary key constraints or generates unique key values, replicating the functionality of a stored procedure.

4. Practical / Experiment Steps

        The work was carried out through the following activities:
        1.	Table Structure Design: Created the employees table with appropriate attributes, defining emp_id as the primary key to uniquely identify each record. 
        2.	Sequence Creation: Defined a database sequence (emp_seq) to generate a continuous series of unique values for automatic ID assignment. 
        3.	Trigger Function Development: Implemented a PL/pgSQL function to check whether a primary key value is provided during insertion. 
        4.	Automatic Key Assignment Logic: Incorporated logic within the function to fetch the next sequence value using nextval() when emp_id is not supplied. 
        5.	Trigger Configuration: Linked the function to the table using a BEFORE INSERT trigger to ensure execution prior to data insertion. 
        6.	Encapsulation of Logic: Ensured that the key generation process is handled internally within the database, eliminating the need for manual intervention. 
        7.	Testing and Validation: Inserted multiple records without specifying emp_id and verified the results using a SELECT query to confirm correct sequential ID generation.

5. Procedure of the Practical

        Execution was performed in the following order:
        •	Opened PostgreSQL and started a new database session. 
        •	Created the employees table using the CREATE TABLE command. 
        •	Defined a sequence starting from 1 for ID generation. 
        •	Wrote the auto_emp_id() trigger function for dynamic key assignment. 
        •	Implemented logic to assign a value only when emp_id is not provided. 
        •	Created the trigger trg_auto_emp_id and attached it to the table. 
        •	Inserted sample records without specifying the primary key. 
        •	Executed a SELECT * query to confirm that IDs were generated automatically in sequence (1, 2, etc.). 
        •	Recorded the results to show how triggers can simulate auto-increment behavior used in industry systems.

6. I/O Analysis (Input / Output Analysis)
Input Queries
SQL

        CREATE TABLE employees1 (
            emp_id INTEGER PRIMARY KEY,
            emp_name VARCHAR(100),
            department VARCHAR(50)
        );

<img width="214" height="174" alt="Screenshot 2026-04-24 185854" src="https://github.com/user-attachments/assets/97aa9b49-e60e-4239-8d50-448d2978be97" />


    CREATE SEQUENCE emp_seq
    START 1;

<img width="233" height="122" alt="Screenshot 2026-04-24 185927" src="https://github.com/user-attachments/assets/ae44c1da-ee28-4c74-893c-f014a78e2f76" />
 

    CREATE OR REPLACE FUNCTION auto_emp_id()
    RETURNS TRIGGER AS $$
    BEGIN
        IF NEW.emp_id IS NULL THEN
            NEW.emp_id := nextval('emp_seq');
        END IF;
        RETURN NEW;
    END;
    $$ LANGUAGE plpgsql;

<img width="282" height="194" alt="Screenshot 2026-04-24 185955" src="https://github.com/user-attachments/assets/5eff7ca5-5b87-4e85-bdbf-bd32c425207c" />
 

    CREATE TRIGGER trg_auto_emp_id
    BEFORE INSERT ON employees1
    FOR EACH ROW
    EXECUTE FUNCTION auto_emp_id();

<img width="229" height="125" alt="Screenshot 2026-04-24 190021" src="https://github.com/user-attachments/assets/0a4bd133-a455-4656-9230-a99c0edb0e96" />


    INSERT INTO employees1 (emp_name, department)
    VALUES ('AliceD', 'HR');
    
    INSERT INTO employees1 (emp_name, department)
    VALUES ('Bob', 'IT');

<img width="288" height="139" alt="Screenshot 2026-04-24 190257" src="https://github.com/user-attachments/assets/bca08166-68be-401a-8e05-917256fab79f" />
 

    SELECT * FROM employees1;

<img width="292" height="125" alt="Screenshot 2026-04-24 190331" src="https://github.com/user-attachments/assets/0fa2e917-7baf-472b-b8eb-272352683198" />


7. Learning Outcome

        •	Automation using Triggers: Learned how to eliminate manual primary key entry through trigger-based automation. 
        •	Use of Sequences: Gained understanding of generating unique identifiers using database sequences. 
        •	Maintaining Data Integrity: Learned how BEFORE INSERT triggers help validate and modify data before storage. 
        •	Encapsulation of Logic: Understood how databases can independently manage key assignment without relying on application-level code.
