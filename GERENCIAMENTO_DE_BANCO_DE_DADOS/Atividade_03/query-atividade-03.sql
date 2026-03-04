WITH
u AS (
    SELECT first_name, last_name
    FROM employees
    WHERE gender = 'M'
    UNION
    SELECT first_name, last_name
    FROM employees
    WHERE gender = 'F'
),
ua AS (
    SELECT first_name, last_name
    FROM employees
    WHERE gender = 'M'
    UNION ALL
    SELECT first_name, last_name
    FROM employees
    WHERE gender = 'F'
),
e AS (
    SELECT first_name, last_name
    FROM employees
    WHERE gender = 'M'
    EXCEPT
    SELECT first_name, last_name
    FROM employees
    WHERE gender = 'F'
),
i AS (
    SELECT first_name, last_name
    FROM employees
    WHERE gender = 'M'
    INTERSECT
    SELECT first_name, last_name
    FROM employees
    WHERE gender = 'F'
)

SELECT 'UNION' AS operacao, COUNT(*) AS total FROM u
UNION ALL
SELECT 'UNION ALL', COUNT(*) FROM ua
UNION ALL
SELECT 'EXCEPT', COUNT(*) FROM e
UNION ALL
SELECT 'INTERSECT', COUNT(*) FROM i;
