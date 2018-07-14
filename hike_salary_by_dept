declare
  v_deptid  employees.department_id%type;
  v_salary  employees.salary%type;
begin
  select department_id, salary into v_deptid, v_salary
  from employees
  where employee_id = 130;
  
  case 
   when v_deptid < 50 then
        v_salary := v_salary * 1.2;
   when v_deptid < 100 then
        v_salary := v_salary * 1.3;        
   else
        v_salary := v_salary * 1.25;        
  end case;
  
  update employees set salary = v_salary
  where employee_id = 130;
  
  rollback;
end;

      
  
