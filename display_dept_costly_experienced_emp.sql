set serveroutput on
declare
  cursor dept_cursor is
   select d.department_id, department_name, first_name manager
   from departments d join employees e
   on (d.manager_id  = e.employee_id);
   
   v_costly_employee  employees.first_name%type;
   v_experienced_employee  employees.first_name%type;

begin
   for deptrec in dept_cursor
   loop
      -- find out employee with highest salary 
     
      select first_name into v_costly_employee
      from (
         select first_name from employees
         where salary = ( select max(salary) from employees 
                       where department_id = deptrec.department_id)
         and department_id = deptrec.department_id
         order by hire_date)
      where rownum = 1;   
    
                
      -- find out employee with highest experience 
      select first_name  into v_experienced_employee
      from (
         select first_name
         from employees
         where hire_date = ( select min(hire_date) from employees 
                   where department_id = deptrec.department_id)
                   and department_id = deptrec.department_id)
      where rownum = 1;
      
      dbms_output.put_line( rpad(deptrec.department_name,20) || ' ' ||
                            rpad(deptrec.manager,20) || ' ' ||
                            rpad(v_costly_employee,20) || ' ' ||
                            rpad(v_experienced_employee,20) );
   end loop;
   
end;
