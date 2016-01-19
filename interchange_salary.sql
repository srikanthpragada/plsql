set serveroutput on 
declare
    v_salary  employees.salary%type;
begin
   select salary into v_salary
   from employees
   where employee_id = 120;
   
   update employees set salary = ( select salary from employees where employee_id = 130)
   where employee_id = 120;
   
   update employees set salary = v_salary
   where employee_id = 130;
   
   commit; 
   
   dbms_output.put_line('Interchanged successfully!');
   
end;   
   
   
   
