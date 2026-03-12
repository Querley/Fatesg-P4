-- Consulta 2
SELECT
    de.emp_no,
    (SELECT e.first_name FROM employees e WHERE e.emp_no = de.emp_no) AS first_name,
    (SELECT e.last_name FROM employees e WHERE e.emp_no = de.emp_no) AS last_name,
    (SELECT d.dept_name FROM departments d WHERE d.dept_no = de.dept_no) AS dept_name
FROM dept_emp de
WHERE de.to_date > CURRENT_DATE;

-- Analise consulta 2
EXPLAIN FORMAT=TREE
SELECT
    de.emp_no,
    (SELECT e.first_name FROM employees e WHERE e.emp_no = de.emp_no) AS first_name,
    (SELECT e.last_name FROM employees e WHERE e.emp_no = de.emp_no) AS last_name,
    (SELECT d.dept_name FROM departments d WHERE d.dept_no = de.dept_no) AS dept_name
FROM dept_emp de
WHERE de.to_date > CURRENT_DATE;

-- Comentário:
-- Nesta consulta a tabela principal é dept_emp e os outros dados
-- são obtidos através de subconsultas nas tabelas employees e
-- departments. O custo pode ser maior pois cada linha executa
-- subconsultas adicionais.
