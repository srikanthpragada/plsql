set serveroutput on
declare
   v_start employees.employee_id%type;
   v_end   employees.employee_id%type;
   v_count number(1);
begin

   select min(employee_id) + 1 ,  max(employee_id) - 1 into v_start, v_end
   from employees;
   
   for empid in v_start..v_end
   loop
      select count(*) into v_count
      from employees
      where employee_id = empid;
      
      if v_count = 0 then
        dbms_output.put_line(empid);
      end if;
      
   end loop;
   
end;
