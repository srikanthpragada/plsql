set serveroutput on
declare
  v_maxsal employees.salary%type;
  v_count  number(3);
  v_start  employees.salary%type;
  v_end    employees.salary%type;
begin

   select max(salary) into v_maxsal
   from employees;
   dbms_output.put_line('Salary Ranges');
   
   v_start := 0;
   while v_start <= v_maxsal
   loop
       v_end := v_start + 999;
       select count(*) into v_count
       from employees
       where salary between v_start and v_end;
       
       if v_count > 0 then
             dbms_output.put_line(to_char(v_start,'99999') || ' - ' || to_char(v_end,'99999')  ||  ' : ' || to_char(v_count,'999'));
       end if;             
       
       v_start := v_start + 1000;
   end loop;

end;

output
=======
Salary Ranges
  2000 -   2999 :   23
  3000 -   3999 :   18
  4000 -   4999 :    7
  5000 -   5999 :    2
  6000 -   6999 :   11
  7000 -   7999 :   11
  8000 -   8999 :    8
  9000 -   9999 :    8
 10000 -  10999 :    6
 11000 -  11999 :    4
 12000 -  12999 :    3
 13000 -  13999 :    2
 14000 -  14999 :    1
 17000 -  17999 :    2
 24000 -  24999 :    1
