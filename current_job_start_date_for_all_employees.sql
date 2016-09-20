set serveroutput on
declare
  cursor empcur is
   select employee_id, first_name, job_title , hire_date
   from employees natural join jobs;
   
   v_date date;
begin
   for emprec in empcur
   loop
       -- find out most recent end_date in job_history
       select max(end_date) + 1 into v_date
       from job_history
       where employee_id = emprec.employee_id;
   
       if v_date is null then
             v_date :=  emprec.hire_date;      
       end if;
       dbms_output.put_line( rpad(emprec.first_name,15) || ' ' || rpad(emprec.job_title,35)
           || to_char(v_date,'dd-mon-yyyy'));
   end loop;
end;   
