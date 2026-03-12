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
EXPLAIN FORMAT=TREE
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
-- A consulta utiliza EXISTS como filtro para verificar se o funcionário
-- possui registro atual na tabela dept_emp (to_date > current_date).
-- O plano de execução mostra o custo das junções entre dept_emp,
-- employees e departments.

