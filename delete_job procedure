create or replace procedure delete_job(p_jobid varchar)
is
  v_count number(3);
begin
  select count(*) into v_count
  from  (select employee_id from employees where job_id = p_jobid
         union
         select employee_id from job_history where job_id = p_jobid);
  if v_count = 0 then
     delete from jobs where job_id = p_jobid;
     if sql%notfound then
        raise_application_error(-20201,'Invalid Job Id');
     end if;
  else
     raise_application_error(-20200,'Job cannot be deleted as it has employees');
  end if;
end;

Calling
==========
begin
   delete_job('abc');
end;
