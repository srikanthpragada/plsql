set serveroutput on
declare
   cursor deptcur is
      select department_id,department_name
      from departments
      where department_id in (select department_id from employees);

   cursor empcur(p_dept number) is 
      select first_name, job_title, hire_date 
      from employees  natural join jobs 
      where department_id = p_dept and salary = 
          (select max(salary) from employees where department_id = p_dept);
begin
   for deptrec in deptcur
   loop
       dbms_output.put_line(deptrec.department_name);
       for emprec in empcur(deptrec.department_id)
       loop
          dbms_output.put_line( '***' || rpad(emprec.first_name,15) ||
              rpad(emprec.job_title,35) || emprec.hire_date);
       end loop;
       
   end loop;
end;   


Output
=========
Administration
***Jennifer       Administration Assistant           17-SEP-03
Marketing
***Michael        Marketing Manager                  17-FEB-04
Purchasing
***Den            Purchasing Manager                 07-DEC-02
Human Resources
***Susan          Human Resources Representative     07-JUN-02
Finance
***Nancy          Finance & Accounting Manager       17-AUG-02
***Daniel         Accountant                         16-AUG-02
Accounting
***Shelley        Accounting Manager                 07-JUN-02
