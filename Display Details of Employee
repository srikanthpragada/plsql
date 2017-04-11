set serveroutput on
declare
   v_name    employees.first_name%type;
   v_manager employees.first_name%type;
   v_exp     number(2);
   v_count   number(2);
   v_empid   number(5) := 180;
begin
   select first_name, 
          floor( months_between(sysdate, hire_date) / 12),
          (select first_name from employees where employee_id = d.manager_id)
      into v_name, v_exp, v_manager
   from employees e join departments d using(department_id)
   where employee_id = v_empid;
   
   select count(*) into v_count
   from job_history
   where employee_id = v_empid;
   
   dbms_output.put_line('Name             : ' || v_name);
   dbms_output.put_line('Experience(year) : ' || v_exp);
   dbms_output.put_line('Manager          : ' || v_manager);
   dbms_output.put_line('Jobs Count       : ' || v_count);

end;

   
