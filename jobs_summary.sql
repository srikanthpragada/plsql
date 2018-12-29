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
  v_max_sal    employees.salary%type;
  v_names      varchar(100);
  
  cursor empnames(jobid varchar, maxsal number) is
    select first_name 
    from employees
    where job_id = jobid and salary = maxsal;
    
begin
  for jobrec in jobcur
  loop
     select avg(salary), count(*), max(salary), 
            avg(floor(months_between(sysdate,hire_date)/12))
            into v_avg_sal, v_count, v_max_sal, v_avg_exp
     from employees
     where job_id = jobrec.job_id;
     
     select count(*) into v_count_hist
     from job_history
     where job_id = jobrec.job_id;
     
     v_names := '';
     for namerec in empnames(jobrec.job_id, v_max_sal)
     loop
          v_names := v_names || namerec.first_name || ',';
     end loop;
    
     
     dbms_output.put_line('Job Title       : ' || jobrec.job_title);
     dbms_output.put_line('No. Employees   : ' || v_count);
     dbms_output.put_line('Avg Salary      : ' || v_avg_sal);
     dbms_output.put_line('Avg Exp         : ' || v_avg_exp);
     dbms_output.put_line('History Count   : ' || v_count_hist);
     dbms_output.put_line('Top Employee(s) : ' || rtrim(v_names,','));
  end loop;  
     

end;
