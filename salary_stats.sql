-- Display no. of employees with salary > avg, < avg and = avg
set serveroutput on 
declare
   v_avg_salary employees.salary%type;
   v_high number(2);
   v_same number(2);
   v_low number(2);
begin
   select avg(salary) into v_avg_salary
   from employees;
   
   select count(*) into v_high
   from employees
   where salary > v_avg_salary;
   
   select count(*) into v_same
   from employees
   where salary = v_avg_salary;
   
   select count(*) into v_low
   from employees
   where salary < v_avg_salary;
   
   dbms_output.put_line('Higher than avg : ' || v_high);
   dbms_output.put_line('Same as avg     : ' || v_same);
   dbms_output.put_line('Lower than  avg : ' || v_low);
 
end;   
  
