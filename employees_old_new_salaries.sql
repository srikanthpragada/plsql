set serveroutput on
declare
   v_min     employees.employee_id%type;
   v_max     employees.employee_id%type;
   v_salary  employees.salary%type;
   v_count   number(1);
   v_exp     number(2);
begin
   select min(employee_id), max(employee_id) into v_min, v_max
   from employees;
   
   for empid in v_min..v_max
   loop
      -- whether employee is present 
      select count(*) into v_count
      from employees
      where employee_id = empid;
      
      if v_count = 0 then
         dbms_output.put_line( empid || ' Not Found');
      else
         -- find out whether employee has job history
         select salary, floor(months_between(sysdate,hire_date)/ 12) into v_salary, v_exp
         from employees
         where employee_id = empid;
         
         select count(*) into v_count
         from job_history
         where employee_id = empid;
         
         if v_count <> 0 then  
             dbms_output.put_line( empid || ' '  || lpad(to_char(round(v_salary)),6) 
                  || ' ' || lpad(to_char( round(v_salary * 1.2)),6) );
         elsif  v_exp > 10 then
             dbms_output.put_line( empid || ' '  || lpad(to_char(round(v_salary)),6) 
                  || ' ' || lpad(to_char( round(v_salary * 1.15)),6) );
         else
             dbms_output.put_line( empid || ' '  || lpad(to_char(round(v_salary)),6) 
                  || ' ' || lpad(to_char( round(v_salary * 1.1)),6) );
         end if;             
      end if;
   end loop;
end;   
   
