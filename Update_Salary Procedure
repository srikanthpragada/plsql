Version 1
=========
create or replace procedure  update_salary(p_empid number, p_new_salary number)
is
   employee_not_found  exception;
begin
    update employees 
      set salary = p_new_salary
    where employee_id = p_empid;

    if sql%found then
      commit;
    else
       raise employee_not_found;
    end if;
exception 
  when employee_not_found then
     raise_application_error(-20111,'Employee Id [' || p_empid || '] Not Found'); 
  when others then
     raise_application_error(-20111,'Update_Salary Error -->' || sqlerrm ); 
end;

Version 2
==========
1. Adds condition that new salary must not be <= existing salary
2. Inserts a new row into salary_history table 

create or replace procedure  update_salary2(p_empid number, p_new_salary number)
is
   v_salary employees.salary%type;
   invalid_salary  exception;
begin
    select salary into v_salary
    from employees
    where employee_id = p_empid;
    
    if p_new_salary <= v_salary then
        raise invalid_salary;
    end if;
    
    update employees 
      set salary = p_new_salary
    where employee_id = p_empid;
    
    -- write old and new salary details to salary_history 
    -- insert into salary_history values(p_empid, sysdate, v_salary, p_new_salary);
    
    if sql%found then
      commit;
    end if;
    
exception 
  when no_data_found then
     raise_application_error(-20111,'Employee Id [' || p_empid || '] Not Found'); 
  when invalid_salary then
     raise_application_error(-20111,'New salary cannot be same or less than existing salary'); 
  when others then
     raise_application_error(-20111,'Update_Salary Error -->' || sqlerrm ); 
end;


Calling
========
execute update_salary(120,7000)

