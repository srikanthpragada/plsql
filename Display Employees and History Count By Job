set serveroutput on
declare
  cursor jobcur is
  select job_id, job_title
  from   jobs
  where  job_id  in ( select job_id from employees)
  order by 2;
  
  cursor  empcur (p_jobid varchar)
  is
  select  first_name, count(start_date) jobcount 
  from employees e left outer join job_history jh using (employee_id)
  where e.job_id = p_jobid
  group by first_name
  order by 1;
 
begin
  for jobrec in jobcur
  loop
      dbms_output.put_line(jobrec.job_title);
      for emprec in empcur( jobrec.job_id)
      loop
         dbms_output.put_line('    ' || rpad(emprec.first_name,20) ||  emprec.jobcount);
      end loop; 
  end loop;       
end;
