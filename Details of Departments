set serveroutput on

declare
   cursor deptcur is
    select  d.department_id id, department_name name, city, nvl(first_name,'-') manager
    from departments d left outer join employees e on (d.manager_id = e.employee_id)
    join locations l using(location_id)
    order by 2;

   v_name employees.first_name%type;
   v_max_salary employees.salary%type;
begin

    for deptrec in  deptcur
    loop
        select max(salary) into v_max_salary
        from employees
        where department_id = deptrec.id;

        if v_max_salary is null then
             v_name := '-';
        else
           select first_name into v_name
           from employees 
           where department_id = deptrec.id and salary = v_max_salary;
        end if;

        dbms_output.put_line( rpad(deptrec.name,20) || rpad(deptrec.manager,15) ||  
                 rpad(deptrec.city,20) || rpad(v_name,20));
    end loop;



end;

  
