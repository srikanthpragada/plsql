set serveroutput on 

declare
 v_count number(2);
 v_per   number(2);
 v_total number(3);
begin

 select count(*) into v_total
 from employees;
 
 dbms_output.put_line('No. employees per months');
 
 for month in 1..12
  loop
   select count(*) into v_count 
   from employees
   where to_char(hire_date,'mm') = month;
   v_per := floor(v_count / v_total * 100);
   dbms_output.put_line(to_char(month,'99') || ' - ' || to_char(v_count,'999') || ' - ' || to_char(v_per,'999') || '%');
  end loop;
end;


Output 
======
No. employees per months
  1 -   14 -   13%
  2 -   13 -   12%
  3 -   17 -   15%
  4 -    7 -    6%
  5 -    6 -    5%
  6 -   11 -   10%
  7 -    7 -    6%
  8 -    9 -    8%
  9 -    5 -    4%
 10 -    6 -    5%
 11 -    5 -    4%
 12 -    7 -    6%
 
