
SALARY_HISTORY Table
====================
EMPLOYEE_ID	NUMBER(5,0)	
OLD_SALARY	NUMBER(5,0)			
NEW_SALARY	NUMBER(5,0)	
CHANGED   	DATE	


create or replace TRIGGER TRG_EMPLOYEES_SALARY_CHANGE_LOG 
AFTER UPDATE OF SALARY 
ON EMPLOYEES 
FOR EACH ROW 
WHEN (old.salary <> new.salary) 
BEGIN
   insert into salary_history values(:old.employee_id, :old.salary, :new.salary, sysdate);
END;
