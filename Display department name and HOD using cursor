set serveroutput on
declare
  cursor deptcur is
    select department_name, manager_id from departments;
    
  v_manager  employees.first_name%type;    
begin
  for deptrec in deptcur
  loop
        if deptrec.manager_id is null then
            v_manager := 'NULL';
        else
          -- get HOD name 
          select first_name into v_manager
          from employees where employee_id = deptrec.manager_id;
        end if;
        dbms_output.put_line( rpad(deptrec.department_name,30) ||  v_manager);
  end loop;
   
end;    
    
