-- criação da tabela logs
create table logs (
   dthr datetime not null default current_timestamp,
   operacao char(1) not null,
   tabela varchar(100) not null,
   novo text,
   antigo text,
   autor varchar(100) default null
);

-- triggers employees

-- after insert
create trigger trg_ai_employees
after insert on employees
for each row
insert into logs (operacao, tabela, novo, autor)
values ('I','employees',
concat('emp_no=', new.emp_no, ', name=', new.first_name, ' ', new.last_name),
user());

-- after update
create trigger trg_au_employees
after update on employees
for each row
insert into logs (operacao, tabela, novo, antigo, autor)
values ('A','employees',
concat('emp_no=', new.emp_no, ', name=', new.first_name, ' ', new.last_name),
concat('emp_no=', old.emp_no, ', name=', old.first_name, ' ', old.last_name),
user());

-- after delete
create trigger trg_ad_employees
after delete on employees
for each row
insert into logs (operacao, tabela, antigo, autor)
values ('E','employees',
concat('emp_no=', old.emp_no, ', name=', old.first_name, ' ', old.last_name),
user());

-- triggers titles

-- after insert
create trigger trg_ai_titles
after insert on titles
for each row
insert into logs (operacao, tabela, novo, autor)
values ('I','titles',
concat('emp_no=', new.emp_no, ', title=', new.title),
user());

-- after update
create trigger trg_au_titles
after update on titles
for each row
insert into logs (operacao, tabela, novo, antigo, autor)
values ('A','titles',
concat('emp_no=', new.emp_no, ', title=', new.title),
concat('emp_no=', old.emp_no, ', title=', old.title),
user());

-- after delete
create trigger trg_ad_titles
after delete on titles
for each row
insert into logs (operacao, tabela, antigo, autor)
values ('E','titles',
concat('emp_no=', old.emp_no, ', title=', old.title),
user());
