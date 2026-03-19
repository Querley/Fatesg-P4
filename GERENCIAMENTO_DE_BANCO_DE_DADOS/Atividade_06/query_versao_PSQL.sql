with media_salarios as (
    select 
        t.title,
        avg(s.salary) as media_salario
    from titles t
    join salaries s on t.emp_no = s.emp_no
    where t.to_date > current_date
    and s.to_date > current_date
    group by t.title
)

select 
    title,
    media_salario
from media_salarios
order by media_salario desc;
