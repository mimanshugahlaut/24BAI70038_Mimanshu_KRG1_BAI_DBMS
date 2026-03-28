CREATE TABLE employe(
	emp_id INT PRIMARY KEY,
	emp_name VARCHAR(20),
	gender VARCHAR(20),
	salary NUMERIC(10, 2)
);

INSERT INTO employe (emp_id, emp_name, gender, salary) VALUES
(101, 'Amitabh', 'Male', 30000),
(102, 'Annu', 'Female', 55000),
(103, 'Riya', 'Female', 45000),
(104, 'Amrit', 'Male', 59000),
(105, 'Anjali', 'Female', 66000);

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
