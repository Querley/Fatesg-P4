create view vw_funcionario_info as
select 
    e.emp_no,
    concat(e.first_name, ' ', e.last_name) as name,
    d.dept_name,
    t.title,
    to_char(s.salary, 'FM999,999,999.00') as salary
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
join titles t on e.emp_no = t.emp_no
join salaries s on e.emp_no = s.emp_no
where de.to_date > current_date
and t.to_date > current_date
and s.to_date > current_date
order by s.salary desc;


