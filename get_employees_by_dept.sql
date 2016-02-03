-- returns names of employees for the given deparment
create or replace function get_employees_by_dept (p_deptid number) 
return varchar2
is
  cursor empcur is
    select first_name from employees where department_id = p_deptid;
  v_names varchar2(2000) := '';  
begin
  for emprec in empcur
  loop
      v_names := v_names || emprec.first_name || ',';
  end loop;
  
  return rtrim(v_names,',');
end;

-- call it from PL/SQL block
set serveroutput on
begin
   dbms_output.put_line( get_employees_by_dept(80));
end;   

-- Call it from SQL SELECT
select department_name, get_employees_by_dept(department_id)
from  departments where department_id in ( select department_id from employees)

