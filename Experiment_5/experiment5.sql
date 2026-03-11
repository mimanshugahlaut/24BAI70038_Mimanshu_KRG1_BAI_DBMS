CREATE TABLE employees(
	emp_id INT PRIMARY KEY,
	emp_name VARCHAR(20),
	emp_sal INT
);

INSERT INTO employees VALUES(1,'Harry',13000);
INSERT INTO employees VALUES(2,'Ron',18907);
INSERT INTO employees VALUES(3,'John',18000);
INSERT INTO employees VALUES(4,'Peter',29001);
INSERT INTO employees VALUES(5,'Stephen',16000);

SELECT *,
CASE 
	WHEN emp_sal % 2=0 THEN 'Even Salary'
	ELSE 'Odd Salary'
END AS salary_type
FROM employees;
