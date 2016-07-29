set serveroutput on
declare
   cursor deptcur is
      select department_id, department_name, max(salary) maxsalary
      from employees join departments using (department_id)
      group by department_id, department_name;
    
   v_name  employees.first_name%type;   
begin
   for deptrec in deptcur
   loop
      select first_name into v_name
      from 
       (select first_name
        from employees
        where department_id = deptrec.department_id  and 
              salary = deptrec.maxsalary
        order by hire_date      
       )
      where rownum = 1;  
      
      dbms_output.put_line( deptrec.department_name ||  ' - ' || v_name);
   end loop;
end;   
          
      
  
