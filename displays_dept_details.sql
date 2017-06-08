set serveroutput on
declare
   cursor deptcur is
     select department_id, department_name, trunc(avg(salary)) avgsalary
     from employees join departments using (department_id)
     group by department_id,department_name;
    
   v_name  employees.first_name%type;
   v_exp   number(2);
begin
     
     for deptrec in deptcur
     loop
        --  get employee with highest salary in the dept
        select first_name into v_name
        from (
          select *
          from employees 
          where salary = (select max(salary) from employees
                          where department_id = deptrec.department_id )
          and department_id = deptrec.department_id
          order by employee_id )
        where rownum = 1;  
        
        -- experience of hod
        select trunc(months_between(sysdate, hire_date) / 12) into v_exp
        from employees
        where employee_id = ( select manager_id from departments
                              where  department_id = deptrec.department_id);
                              
        dbms_output.put_line( rpad(deptrec.department_name,30) ||  
                              rpad(v_name,20)  ||
                              rpad(to_char(v_exp),5)   ||  
                              to_char(deptrec.avgsalary) );
    end loop;
end;


Output
=========

Finance                       Daniel              14   7483
Shipping                      Adam                12   3679
Public Relations              Hermann             15   10000
Purchasing                    Den                 14   4466
Executive                     Steven              13   11666
Administration                Jennifer            13   4400
Accounting                    Shelley             15   10154
Human Resources               Susan               15   6500
Marketing                     Michael             13   9500
IT                            Smith               11   5896
Sales                         John                12   8714


         
          
