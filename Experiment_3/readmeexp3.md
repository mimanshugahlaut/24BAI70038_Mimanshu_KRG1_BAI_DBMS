Experiment 3: PL/SQL program

1. Aim of the Session

To understand the basic structure of a PL/SQL program by creating and executing a simple PL/SQL block that includes declaration and execution sections, and to display output using built-in procedures.

2. Software Requirements:

    •	  Database: Oracle SQL

3. Objective of the Session

To create a simple PL/SQL program demonstrating Declaration Section and Execution Section.

4. Practical / Experiment Steps

The work was carried out through the following activities:

    a.	 Program Structure Definition: Designed a basic PL/SQL block consisting of declaration and execution sections to understand the program flow.

    b.	 Variable Declaration: Declared required variables in the DECLARE section with appropriate data types.

    c.	 Logic Implementation: Wrote executable statements inside the BEGIN…END block to perform operations using declared variables.

    d.	 Output Display: Used built-in procedures such as DBMS_OUTPUT.PUT_LINE to display results on the screen.

    e.   Execution and Verification: Executed the PL/SQL block and verified correct output generation and successful program execution.

5. Procedure of the Practical

Execution was performed in the following order:

    a.	Environment Initialization: Opened the Oracle SQL environment (SQL*Plus / SQL Developer) and connected to the database server.

    b.	Session Configuration: Enabled output display using the SET SERVEROUTPUT ON command.

    c.	Program Preparation: Wrote a basic PL/SQL block with DECLARE, BEGIN, and END sections.

    d.	Variable Setup: Declared required variables with suitable data types in the declaration section.

    e.	Logic Execution: Implemented executable statements inside the BEGIN block.

    f.	Output Handling: Used DBMS_OUTPUT.PUT_LINE to display execution results.

    g.	Program Execution: Ran the PL/SQL block to execute the program.

    h.	Result Verification: Verified the displayed output to ensure correct program behavior.

    i.	Documentation: Saved the PL/SQL script and recorded the output for submission.

6. I/O Analysis (Input / Output Analysis)

DECLARE

EMP_ID NUMBER:=001;

EMP_NAME VARCHAR(40):='HARRY';

EMP_SALARY NUMBER:=50000;

BEGIN

    DBMS_OUTPUT.PUT_LINE('EMPLOYEE ID: ' || EMP_ID);
    DBMS_OUTPUT.PUT_LINE('EMPLOYEE NAME: ' || EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('EMPLOYEE SALARY: ' || EMP_SALARY);
    DBMS_OUTPUT.PUT_LINE('HOUSE RENT ALLOWANCE: ' || (0.25*EMP_SALARY));
    IF EMP_SALARY > 49000 THEN
    DBMS_OUTPUT.PUT_LINE('YOU NEED TO PAY TAX');
    ELSE
    DBMS_OUTPUT.PUT_LINE('YOU WILL NOT PAY TAX');
    END IF;
END;

Output Details

![WhatsApp Image 2026-01-28 at 22 26 27](https://github.com/user-attachments/assets/e8fd0e9c-8c8d-41f7-8c63-836efb706129)


7. Learning Outcome
   
    •	Understood the basic structure of a PL/SQL program.

    •	Learned how to declare and use variables in PL/SQL.

    •	Gained experience in writing executable statements within a PL/SQL block.

    •	Used built-in procedures to display output.

    •	Developed basic procedural programming skills in PL/SQL.
