set serveroutput on
declare
   EMPID constant number(3) := 101;
   v_name       varchar2(50);
   v_job_title  jobs.job_title%type;
   v_dept_name  departments.department_name%type;
   v_job_count  number(2);
   v_net_salary employees.salary%type;
   v_hire_date  date;
   v_months     number(3);
   v_exp_years  number(2);
   v_exp_months number(2);
begin

   select  first_name || ' ' || last_name, department_name, job_title, hire_date, salary + salary * nvl(commission_pct,0)
       into v_name, v_dept_name, v_job_title, v_hire_date, v_net_salary
   from employees e join departments d using(department_id) join jobs using(job_id)
   where employee_id = EMPID;
   
   select count(*) into v_job_count
   from job_history
   where employee_id = EMPID;
   
   -- calculate experience 
   v_months := floor(months_between(sysdate,v_hire_date));
   v_exp_years  := floor(v_months / 12);
   v_exp_months := floor(v_months mod 12);
   
   
   dbms_output.put_line('Name       : ' || v_name);
   dbms_output.put_line('Department : ' || v_dept_name);
   dbms_output.put_line('Job Title  : ' || v_job_title);
   dbms_output.put_line('Net Salary : ' || v_net_salary);
   dbms_output.put_line('Experience : ' || v_exp_years  || ' Years and ' || v_exp_months || ' Months');
   dbms_output.put_line('Job Count  : ' || v_job_count);

end;
