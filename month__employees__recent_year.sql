set serveroutput on
declare
  v_year number(4);
  v_count number(3);
begin
  select to_char(max(hire_date),'yyyy') into v_year
  from employees;
  
  for month in 1..12
  loop
     select count(*) into v_count
     from employees
     where to_char(hire_date,'yyyy') = v_year and
           to_char(hire_date,'mm') = month;
           
     dbms_output.put_line(month || ' - ' || v_count);
  end loop;
end;
 
  
