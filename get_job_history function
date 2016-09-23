create or replace function get_job_history(empid number)
return varchar2
is
   cursor jobscur is 
    select job_title from jobs
    where job_id in ( select job_id from job_history where employee_id = empid);

   v_jobs varchar2(200) := '';
begin
  
   for jobrec in jobscur
   loop
      v_jobs := v_jobs || jobrec.job_title || ',';
   end loop;
   
   return  rtrim(v_jobs,',');
end;   


Testing
=========
select  first_name, get_job_history(employee_id)
from employees 
