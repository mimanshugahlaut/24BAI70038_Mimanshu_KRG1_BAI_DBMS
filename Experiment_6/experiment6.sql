CREATE TABLE Employees(
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR(25),
    emp_role VARCHAR(20),
    emp_salary NUMBER
);

/

INSERT INTO Employees VALUES (201, 'Rahul', 'Engineer', 80000);
INSERT INTO Employees VALUES (202, 'Neha', 'Manager', 95000);
INSERT INTO Employees VALUES (203, 'Arjun', 'Engineer', 87000);
INSERT INTO Employees VALUES (204, 'Priya', 'Analyst', 50000);

/

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

/

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

