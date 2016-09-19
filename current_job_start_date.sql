set serveroutput on
declare
   v_date  date;
   v_empid employees.employee_id%type := 101;
begin
   select max(end_date) + 1 into v_date
   from job_history
   where employee_id = v_empid;
   
   if v_date is null then
      select hire_date into v_date
      from employees
      where employee_id = v_empid;
   end if;
   
   dbms_output.put_line(v_date);
end;   
