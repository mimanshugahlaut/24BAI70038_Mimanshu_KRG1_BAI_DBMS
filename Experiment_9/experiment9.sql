CREATE TABLE emp_data (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    salary NUMBER
);

/

INSERT INTO emp_data VALUES (1, 'Amit', 30000);
INSERT INTO emp_data VALUES (2, 'Riya', 40000);
INSERT INTO emp_data VALUES (3, 'John', 50000);

COMMIT;

/

CREATE OR REPLACE PACKAGE employee_pkg AS

    -- Display all employee records
    PROCEDURE display_all;

    -- Fetch employee by ID
    PROCEDURE find_employee(p_emp_id NUMBER);

END employee_pkg;

/

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

SET SERVEROUTPUT ON;

BEGIN
    employee_pkg.display_all;
END;

/

BEGIN
    employee_pkg.find_employee(2);
END;

/
