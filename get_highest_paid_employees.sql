create or replace function get_highest_paid_employees(p_dept number)
return varchar2
is
   cursor emps is
    select first_name from employees
    where department_id = p_dept
    and salary = ( select max(salary) from employees where department_id = p_dept);
   
   v_names varchar2(100); 
begin
 
    for emprec in emps
    loop
       v_names := v_names || emprec.first_name || ',';
    end loop;
    
    return  rtrim(v_names,',');
end; 


Calling 
=======
select department_name, get_highest_paid_employees(department_id)
from departments
