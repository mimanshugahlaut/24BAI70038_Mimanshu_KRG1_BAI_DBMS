CREATE TABLE employee2 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    working_hours INT,
    perhour_salary NUMERIC,
    total_payable_amount NUMERIC
);


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


CREATE OR REPLACE TRIGGER payable_trigger
BEFORE INSERT
ON employee2
FOR EACH ROW
EXECUTE FUNCTION calculate_amount();



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

SELECT * FROM employee2;

