EXPLAIN FORMAT=TREE
SELECT first_name, last_name, hire_date
FROM employees
WHERE first_name LIKE 'Georgy';

EXPLAIN FORMAT=TREE
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > '2000-01-01';
