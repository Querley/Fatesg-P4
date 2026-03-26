EXPLAIN
SELECT first_name, last_name, hire_date
FROM employees
WHERE first_name LIKE 'Georgy';

EXPLAIN
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > DATE '2000-01-01';
