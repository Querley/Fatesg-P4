-- tabela logs
create table logs (
   dthr timestamp not null default current_timestamp,
   operacao char(1) not null,
   tabela varchar(100) not null,
   novo text,
   antigo text,
   autor varchar(100) default current_user
);

-- função de log
create or replace function fn_logs() 
returns trigger as $$
begin

    if (tg_op = 'INSERT') then
        insert into logs (operacao, tabela, novo, autor)
        values (
            'I',
            tg_table_name,
            row_to_json(new)::text,
            current_user
        );
        return new;

    elsif (tg_op = 'UPDATE') then
        insert into logs (operacao, tabela, novo, antigo, autor)
        values (
            'A',
            tg_table_name,
            row_to_json(new)::text,
            row_to_json(old)::text,
            current_user
        );
        return new;

    elsif (tg_op = 'DELETE') then
        insert into logs (operacao, tabela, antigo, autor)
        values (
            'E',
            tg_table_name,
            row_to_json(old)::text,
            current_user
        );
        return old;
    end if;

end;
$$ language plpgsql;

-- triggers employees
create trigger trg_ai_employees
after insert on employees
for each row execute function fn_logs();

create trigger trg_au_employees
after update on employees
for each row execute function fn_logs();

create trigger trg_ad_employees
after delete on employees
for each row execute function fn_logs();

-- triggers titles
create trigger trg_ai_titles
after insert on titles
for each row execute function fn_logs();

create trigger trg_au_titles
after update on titles
for each row execute function fn_logs();

create trigger trg_ad_titles
after delete on titles
for each row execute function fn_logs();
