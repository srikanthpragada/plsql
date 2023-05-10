-- Display no. of employees with salary > avg, < avg and = avg
set serveroutput on 
declare
   v_high number(2);
   v_same number(2);
   v_low number(2);
begin
   
   select count(case when salary > avg_salary then 1 end), --more than average
          count(case when salary = avg_salary then 1 end), --the same as average
          count(case when salary < avg_salary then 1 end), --less than average
          into v_high, v_same, v_low
   from (
         select salary, avg(salary) over (partition by 1) avg_salary
         from employees
        );
   
   dbms_output.put_line('Higher than avg : ' || v_high);
   dbms_output.put_line('Same as avg     : ' || v_same);
   dbms_output.put_line('Lower than  avg : ' || v_low);
 
end;   
  
