-- function to return names of employees with highest salary in the given job
create or replace function get_top_employees(p_jobid varchar)
return varchar is
 cursor empnames is
    select first_name 
    from employees
    where job_id = p_jobid and salary = 
      (select max(salary) from employees where job_id = p_jobid);

 v_names  varchar(100);
begin
     v_names := '';
     for namerec in empnames
     loop
          v_names := v_names || namerec.first_name || ',';
     end loop;
     
     return rtrim(v_names,',');
end;

---------------------------------------
-- Program to use the above function and display details of jobs 
set serveroutput on
declare
  cursor jobcur is
    select job_id, job_title
    from jobs
    where job_id in
      (select job_id from employees);
  v_count      number(3);    
  v_count_hist number(3);    
  v_avg_exp    number(2);    
  v_avg_sal    employees.salary%type;
  v_names      varchar(100);
    
begin
  for jobrec in jobcur
  loop
     select avg(salary), count(*), 
            avg(floor(months_between(sysdate,hire_date)/12))
            into v_avg_sal, v_count, v_avg_exp
     from employees
     where job_id = jobrec.job_id;
     
     select count(*) into v_count_hist
     from job_history
     where job_id = jobrec.job_id;
     
     v_names := get_top_employees(jobrec.job_id);
   
     
     dbms_output.put_line('Job Title       : ' || jobrec.job_title);
     dbms_output.put_line('No. Employees   : ' || v_count);
     dbms_output.put_line('Avg Salary      : ' || v_avg_sal);
     dbms_output.put_line('Avg Exp         : ' || v_avg_exp);
     dbms_output.put_line('History Count   : ' || v_count_hist);
     dbms_output.put_line('Top Employee(s) : ' || v_names);
  end loop;  
     

end;
