set serveroutput on
declare
   cursor deptcur is
      select department_id, department_name, max(salary) maxsalary
      from employees join departments using (department_id)
      group by department_id, department_name;
      
   cursor empcur(deptno number) is
      select first_name from employees
      where  department_id = deptno  and salary = 
          (select max(salary) from employees where department_id = deptno);
    
   v_names  varchar2(50); 
begin
   for deptrec in deptcur
   loop
      v_names := '';
      for emprec in empcur(deptrec.department_id)
      loop
           v_names := v_names || emprec.first_name || ',';
      end loop;
      dbms_output.put_line( rpad(deptrec.department_name,20) ||  
                                     ' - ' || rtrim(v_names,','));
   end loop;
end;   
          
      
  
