-- Consulta 1
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name
FROM dept_emp de
JOIN employees e ON e.emp_no = de.emp_no
JOIN departments d ON d.dept_no = de.dept_no
WHERE de.to_date > CURRENT_DATE
AND EXISTS (
    SELECT 1
    FROM dept_emp de2
    WHERE de2.emp_no = de.emp_no
    AND de2.to_date > CURRENT_DATE
);

-- Analise consulta 1
EXPLAIN
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name
FROM dept_emp de
JOIN employees e ON e.emp_no = de.emp_no
JOIN departments d ON d.dept_no = de.dept_no
WHERE de.to_date > CURRENT_DATE
AND EXISTS (
    SELECT 1
    FROM dept_emp de2
    WHERE de2.emp_no = de.emp_no
    AND de2.to_date > CURRENT_DATE
);

-- Comentário:
-- A consulta utiliza EXISTS para verificar se o funcionário
-- possui departamento atual. O plano de execução mostra as
-- operações usadas pelo PostgreSQL para realizar os joins.


