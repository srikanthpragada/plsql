set serveroutput on
declare
  v_month number(2) := 1;
  v_count number(3);
begin

  for month in 1 .. 12
  loop
     select count(*) into v_count
     from employees
     where to_char(hire_date,'mm') = month;
     
     dbms_output.put_line( to_char(month,'00') || to_char(v_count,'999'));
  end loop;
end;
