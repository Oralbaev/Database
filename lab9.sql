--1
create or replace function increase_value(n INT)
returns int AS
$$
begin
    return n + 10;
end;
$$ language plpgsql;

--2
create or replace procedure compare_numbers(a int, b int, out result text)
language plpgsql as $$
begin
    if a > b then
        result := 'Greater';
    elsif a = b then
        result := 'Equal';
    else
        result := 'Lesser';
    end if;
end;
$$;

--3
create or replace procedure number_series (n int, out series text)
language plpgsql as $$
declare
    i int;
begin
    if n > 0 then
        series := '1';
    end if;

    for i in 1..n loop
        series := series || ', ' || i;
    end loop;
end;
$$;

--4
create or replace procedure find_employee(emp_name text, out emp_details record)
language plpgsql as $$
begin
    select *
    into emp_details
    from employees
    where name = emp_name;
end;
$$;

--5
create or replace procedure list_products(category_name text, out product_table table (id int, name text, price int))
language plpgsql as $$
begin
    return query
    select id, text, price
    from products
    where category = category_name;
end;
$$;

--6
create or replace function calculate_bonus(emp_id int)
returns int as $$
begin
    return (select salary * 0.1
            from employees
            where id = emp_id);
end;
$$ language plpgsql;

create or replace procedure update_salary(emp_id int)
language plpgsql as $$
begin
    update employees
    set salary = salary + calculate_bonus(emp_id)
    where id = emp_id;
end;
$$;

--7
create or replace function complex_calculation(n int, s text)
returns text as $$
declare
    new_n int;
    new_s text;
    res text;
begin
    <<numeric_computation>>
    begin
        new_n = n * 2;
    end numeric_computation;

    <<string_manipulation>>
    begin
        new_s := 'Hello, ' || s;
    end string_manipulation;

    res := new_s || ' your number is: ' || new_n;
    return res;
end;
$$;
