CREATE database lab1; --task1
create table users  --task2
(
    id serial,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);
alter table users  --task3
    add column isadmin int;
alter table users  --task4
    alter column isadmin TYPE boolean USING isadmin::boolean;
alter table users  --task5
    alter column isadmin set default false;
alter table users  --task6
    add primary key(id);
create table tasks  --task7
(
    id serial,
    name VARCHAR(50),
    user_id int
);
drop table tasks;  --task8
drop database lab1  --task9