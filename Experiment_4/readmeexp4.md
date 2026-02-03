Experiment 4: PL/SQL conditional control statements

1. Aim of the Session

To design and implement PL/SQL programs utilizing conditional control statements such as IF–ELSE, ELSIF, ELSIF ladder, and CASE constructs in order to control the flow of execution based on logical conditions and to analyze decision-making capabilities in PL/SQL blocks.

2. Software Requirements:

   • Database: Oracle SQL

4. Objective of the Session

Implement control structures in PL/SQL (IF-ELSE, ELSE-IF,ELSE-IF LADDER, CASE STATEMENTS in PL/SQL BLOCK).

4. Practical / Experiment Steps

The work was carried out through the following activities:
    
    1.  Open the Oracle SQL environment and connect to the database using valid credentials.
    2.	Create a new SQL worksheet for writing the PL/SQL program.
    3.	Declare required variables in the DECLARE section of the PL/SQL block.
    4.	Write the PL/SQL code using conditional control statements such as IF–ELSE, ELSIF ladder and CASE.
    5.	Observe and verify the output for different input values.

5. Procedure of the Practical

Execution was performed in the following order:

    1.	The Oracle SQL environment is opened and a connection to the database is established using valid user credentials.
    2.	Server output is enabled using the command SET SERVEROUTPUT ON to display the results of PL/SQL execution.
    3.	A PL/SQL block is written by declaring required variables in the DECLARE section.
    4.	Conditional control statements such as IF–ELSE, IF–ELSIF–ELSE, ELSIF ladder, and CASE are implemented in the BEGIN…END block according to the problem statements.
    5.	Output messages are displayed using the DBMS_OUTPUT.PUT_LINE statement based on evaluated conditions.
    6.	The PL/SQL program is executed and the output is observed.
    7.	The program is modified with different input values and re-executed to verify correctness.

6. I/O Analysis (Input / Output Analysis)

Query 1: IF–ELSE (Check Positive/Non-Positive)

    DECLARE
    num NUMBER:=-3;
    
    BEGIN
        IF num>0 THEN
        DBMS_OUTPUT.PUT_LINE('The number is positive');
        ELSE
        DBMS_OUTPUT.PUT_LINE('The number is not positive');
        END IF;
    END;


Query 2: IF-ELSEIF-ELSE (Student Grading)

    DECLARE
    marks NUMBER:=78;
    
    BEGIN
        IF marks>=90 THEN
        DBMS_OUTPUT.PUT_LINE('Grade: A');
        ELSIF marks>=75 THEN
        DBMS_OUTPUT.PUT_LINE('Grade: B');
        ELSIF marks>=60 THEN
        DBMS_OUTPUT.PUT_LINE('Grade: C');
        ELSE
        DBMS_OUTPUT.PUT_LINE('Grade: D');
        END IF;
    END;

Query 3: ELSIF Ladder (Student Performance)

    DECLARE
    marks NUMBER:=85;
    
    BEGIN
        IF marks>=90 THEN
        DBMS_OUTPUT.PUT_LINE('Excellent Performance');
        ELSIF marks>=75 THEN
        DBMS_OUTPUT.PUT_LINE('Very Good Performance');
        ELSIF marks>=60 THEN
        DBMS_OUTPUT.PUT_LINE('Good Performance');
        ELSIF marks>=40 THEN
        DBMS_OUTPUT.PUT_LINE('Average Performance');
        ELSE
        DBMS_OUTPUT.PUT_LINE('Poor Performance');
        END IF;
    END;

Query 4: CASE Statement (Day of the Week)

    DECLARE
    num NUMBER:=3;
    
    BEGIN
        CASE num
        WHEN 1 THEN DBMS_OUTPUT.PUT_LINE('Monday');
        WHEN 2 THEN DBMS_OUTPUT.PUT_LINE('Tuesday');
        WHEN 3 THEN DBMS_OUTPUT.PUT_LINE('Wednesday');
        WHEN 4 THEN DBMS_OUTPUT.PUT_LINE('Thursday');
        WHEN 5 THEN DBMS_OUTPUT.PUT_LINE('Friday');
        WHEN 6 THEN DBMS_OUTPUT.PUT_LINE('Saturday');
        WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('Sunday');
        ELSE
        DBMS_OUTPUT.PUT_LINE('Invalid Day Number');
        END CASE;
    END; 

Output Details
![WhatsApp Image 2026-02-03 at 10 44 17](https://github.com/user-attachments/assets/2afc2c24-40b9-409c-8c20-5caa40e9fc3f)
![WhatsApp Image 2026-02-03 at 10 48 50](https://github.com/user-attachments/assets/9971ca4f-d941-4619-a612-3378c174e4a1)
![WhatsApp Image 2026-02-03 at 10 53 58](https://github.com/user-attachments/assets/0f88343b-08f7-4788-b275-34b4dd6ac7be)
![WhatsApp Image 2026-02-03 at 10 58 00](https://github.com/user-attachments/assets/343205ff-50eb-4741-8a32-a4d91c7e1da4)

7. Learning Outcome

          •	Understand the concept of conditional control statements in PL/SQL.
          •	Implement IF–ELSE and IF–ELSIF–ELSE statements for decision making.
          •	Apply the ELSIF ladder to handle multiple conditions efficiently.
          •	Use the CASE statement for simplified and structured conditional logic.
          •	Analyze program flow based on logical conditions in PL/SQL blocks.

