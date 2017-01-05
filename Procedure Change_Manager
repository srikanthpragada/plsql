create or replace procedure change_manager(p_empid number, p_manager number)
is
  v_flag  number(1) := 1;
  v_dept1 employees.department_id%type;
  v_dept2 employees.department_id%type;
begin
     select department_id into v_dept1
     from employees
     where employee_id = p_empid;
     
     v_flag := 2;
     
     select department_id into v_dept2
     from employees
     where employee_id = p_manager;
     
     if v_dept1 <> v_dept2 then
        raise_application_error(-20200,'Employee and Manager do not belong to same department');
     else
        update employees set manager_id = p_manager
        where  employee_id = p_empid;
     end if;
exception
     when no_data_found then
       if v_flag = 1 then
         raise_application_error(-20111,'Employee not found');
       else
         raise_application_error(-20112,'Manager not found');
       end if;  
end;
 
