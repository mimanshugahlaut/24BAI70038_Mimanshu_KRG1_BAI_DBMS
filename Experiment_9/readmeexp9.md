Experiment 9: Database Triggers

1. Aim of the Session

        To understand and implement database triggers in PostgreSQL to automate data validation and computational logic, ensuring data integrity by enforcing business rules during DML operations.

2. Software Requirements:

        •	Database Management System:
            o	Oracle Database Express Edition (Oracle XE)
            o	PostgreSQL Database
        •	Database Administration Tool / Client Tool:
            o	Oracle SQL Developer (for Oracle XE)
            o	pgAdmin (for PostgreSQL)

3. Objective of the Session

        •	To create a trigger function that performs automatic calculations on row- level data.
        •	To define a BEFORE INSERT trigger that intercepts data entry for validation.
        •	To implement custom exception handling using the RAISE EXCEPTION command.
        •	To verify trigger behaviour by testing both valid and invalid data scenarios within a transaction.

4. Practical / Experiment Steps

        The work was carried out through the following activities:
        1.	Table Setup: Created an employee table consisting of attributes such as working hours, hourly salary, and a computed salary field.
        2.	Function Implementation: Developed a PL/pgSQL trigger function to calculate total salary based on input values.
        3.	Validation Condition: Added a rule within the function to prevent insertion if the calculated salary crosses a specified threshold.
        4.	Trigger Creation: Defined a row-level trigger to execute before each INSERT operation on the table.
        5.	Testing Phase: Executed multiple test cases using anonymous blocks to verify proper trigger execution and validation.

5. Procedure of the Practical

        Execution was performed in the following order:
        · Opened PostgreSQL environment using pgAdmin.
        · Created the employee table with necessary fields for computation.
        · Defined a trigger function using PL/pgSQL to calculate salary automatically.
        · Utilized the NEW keyword to access incoming tuple values before insertion.
        · Incorporated a condition to check whether the computed salary exceeds a limit.
        · Used RAISE EXCEPTION to block invalid data entries.
        · Created a BEFORE INSERT trigger linked to the table for row-wise execution.
        · Inserted valid data to confirm successful computation and storage.
        · Attempted insertion of invalid data to verify exception handling.
        · Reviewed table contents to ensure only valid records were stored.


6. I/O Analysis (Input / Output Analysis)
Input Queries
SQL

        CREATE TABLE employee2 (
            emp_id INT PRIMARY KEY,
            emp_name VARCHAR(50),
            working_hours INT,
            perhour_salary NUMERIC,
            total_payable_amount NUMERIC
        );
 
<img width="227" height="208" alt="Screenshot 2026-04-16 143654" src="https://github.com/user-attachments/assets/f3b27334-454a-42ac-8d8f-ba6fc695dd33" />


      CREATE OR REPLACE FUNCTION calculate_amount()
      RETURNS TRIGGER
      AS
      $$
      BEGIN
          NEW.total_payable_amount := NEW.working_hours * NEW.perhour_salary;
      
          IF NEW.total_payable_amount > 28000 THEN
              RAISE EXCEPTION 'Calculated amount exceeds limit';
          END IF;
      
          RETURN NEW;
      END;
      $$
      LANGUAGE PLPGSQL;
 
<img width="464" height="272" alt="Screenshot 2026-04-16 143743" src="https://github.com/user-attachments/assets/0e153b44-3b42-4faf-9a35-11e3955b5677" />


    CREATE OR REPLACE TRIGGER payable_trigger
    BEFORE INSERT
    ON employee2
    FOR EACH ROW
    EXECUTE FUNCTION calculate_amount();

<img width="287" height="185" alt="Screenshot 2026-04-16 143827" src="https://github.com/user-attachments/assets/5d80c638-402d-49c0-a3ca-53ef1324c0cb" />


    DO
    $$
    BEGIN
        INSERT INTO employee2(emp_id, emp_name, working_hours, perhour_salary)
        VALUES (1, 'Rohit', 8, 300);
    
    EXCEPTION
        WHEN OTHERS THEN
        RAISE NOTICE '%', SQLERRM;
    END;
    $$;
    
    SELECT * FROM employee2;

<img width="461" height="290" alt="Screenshot 2026-04-16 143934" src="https://github.com/user-attachments/assets/10bf6188-ae9b-4b52-8430-bbcb471daffb" />


    DO
    $$
    BEGIN
        INSERT INTO employee2(emp_id, emp_name, working_hours, perhour_salary)
        VALUES (2, 'Aman', 50, 800);
    
    EXCEPTION
        WHEN OTHERS THEN
        RAISE NOTICE '%', SQLERRM;
    END;
    $$;

<img width="464" height="272" alt="Screenshot 2026-04-16 145008" src="https://github.com/user-attachments/assets/e43fd8b9-6bf9-4ee8-9fe2-cb4219275b48" />


    SELECT * FROM employee2;

<img width="458" height="149" alt="Screenshot 2026-04-16 145210" src="https://github.com/user-attachments/assets/f5721513-dbca-4fe3-adf4-098e6030f326" />


7. Learning Outcome

        •	Understanding Trigger Execution: Learned how triggers automatically execute in response to database events.
        •	Dynamic Data Handling: Gained experience in computing values during insertion without manual input.
        •	Validation Mechanism: Understood how triggers enforce business rules effectively.
        •	Exception Management: Learned how to handle errors using RAISE EXCEPTION.
        •	Data Integrity Assurance: Recognized the importance of triggers in maintaining consistency and correctness of data.
