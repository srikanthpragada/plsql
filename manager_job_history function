create or replace function manager_job_history(p_dept number)
return number is
   v_manager  departments.manager_id%type;
   v_count    number(2);
begin
   -- get manager for the given dept
   select manager_id into v_manager
   from departments
   where department_id = p_dept;
   
   if v_manager is null then
     return null;
   else
     select count(*) into v_count
     from job_history
     where employee_id = v_manager;
     
     return v_count;
   end if;
   
exception
   when no_data_found then
       raise_application_error(-20500,'Department not found');
end;


Calling Function
================
set serveroutput on
begin
   dbms_output.put_line( manager_job_history(20));
end;   



select department_name, manager_job_history(department_id)
from departments
