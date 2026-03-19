-- insert teste
insert into employees 
(emp_no, birth_date, first_name, last_name, gender, hire_date)
values 
(999999, '1990-01-01', 'Teste', 'User', 'M', current_date);

-- update teste
update employees
set first_name = 'Teste2'
where emp_no = 999999;

-- delete teste
delete from employees
where emp_no = 999999;

-- visualizar logs
select *
from logs
order by dthr desc
limit 10;
