--3
select lastname from employees;
--4
select distinct lastname from employees;
--5
select * from employees
WHERE lastname = 'Smith' or lastname = 'Doe';
--6
select * from employees
where department = 14;
--7
select * from employees
where department = 37 or department = 77;
--8
select sum(budget) from departments;
--9
select department, count(*)
from employees
group by department;
--10
select department, count(*)
from employees
group by department
having count(*) > 2;
--11
select name, budget
from departments
order by budget desc
limit 1 offset 1;
--12
select name, lastname, department
from employees
where department IN (
    SELECT code
    FROM departments
    where budget = (select min(budget) from departments)
);
--13
select name from employees
union all
select name from customers
order by name;
--14
select *
from departments
where budget > 60000
order by budget, code desc ;
--15
update departments
set budget = budget * 0.9
where budget = (select min(budget) from departments);
--16
update employees
set department = 14
where department = 77;
--17
delete from employees
where department = 14;
--18
delete from employees;
--19
--select * from customers;
--select * from employees;
--select * from departments;

