CREATE TABLE departments(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(25)
);

CREATE TABLE employees(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(25),
    dept_id INT REFERENCES departments(dept_id),
    salary NUMERIC
);

INSERT INTO departments VALUES (1, 'IT'), (2, 'Finance'), (3, 'Marketing');

INSERT INTO employees VALUES (201, 'Rahul', 1, 90000);
INSERT INTO employees VALUES (202, 'Neha', 2, 60000);
INSERT INTO employees VALUES (203, 'Karan', 1, 85000);
INSERT INTO employees VALUES (204, 'Simran', 3, 50000);

--Simple View--
CREATE VIEW V_BASIC AS
SELECT emp_name, salary FROM employees WHERE salary > 70000;

SELECT * FROM V_BASIC;

--Complex View--
CREATE VIEW V_ADVANCED AS
SELECT d.dept_name, SUM(e.salary) AS total_salary, AVG(e.salary) AS avg_salary
FROM employees e JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

SELECT * FROM V_ADVANCED;

--Materialized View--
CREATE MATERIALIZED VIEW V_STORE AS
SELECT d.dept_name, SUM(e.salary) AS total_salary, AVG(e.salary) AS avg_salary
FROM employees e JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

SELECT * FROM V_STORE;

--Refresh--
REFRESH MATERIALIZED VIEW V_STORE;

--Performance Check--
EXPLAIN ANALYZE SELECT * FROM V_BASIC;

EXPLAIN ANALYZE SELECT * FROM V_ADVANCED;

EXPLAIN ANALYZE SELECT * FROM V_STORE;
