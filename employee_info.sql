set serveroutput on
declare
  v_count number(2);
  v_salary employees.salary%type;
  v_new_salary employees.salary%type;
  EMPID constant number(5) := 102;
begin
  -- get job history count
  select count(*) into v_count
  from job_history
  where employee_id = EMPID;
  
  select salary into v_salary
  from employees
  where employee_id = EMPID;
  -- calculate new salary 
  v_new_salary := v_salary + ( v_salary * (v_count * 10) / 100);
  
  dbms_output.put_line('Job History count  : ' || v_count);
  dbms_output.put_line('Current salary     : ' || v_salary);
  dbms_output.put_line('New salary         : ' || v_new_salary);
end;

  
