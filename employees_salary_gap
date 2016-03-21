SALARY_HISTORY table

Name        Null Type      
----------- ---- --------- 
EMPLOYEE_ID      NUMBER(5) 
OLD_SALARY       NUMBER(5) 
NEW_SALARY       NUMBER(5) 
CHANGED          DATE  

-------------------------------------------------------------------
CREATE OR REPLACE TRIGGER EMPLOYEES_SALARY_GAP
before UPDATE OF SALARY ON EMPLOYEES 
FOR EACH ROW 
WHEN (old.salary <> new.salary) 
declare
  v_changed date;
  invalid_change exception;
BEGIN
    select max(changed) into v_changed
    from salary_history
    where employee_id = :new.employee_id;
    
    if v_changed is not null then
         if  months_between(sysdate,v_changed) < 3 then
             raise invalid_change;
         end if;
    else
         if months_between(sysdate, :new.hire_date) < 3 then
             raise invalid_change;
         end if;             
    end if;         
         
exception 
    when invalid_change then
      raise_application_error(-20222,'Salary cannot be changed within 3 months of previous change');             
    
END;
