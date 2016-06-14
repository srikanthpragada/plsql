CREATE OR REPLACE TRIGGER TRG_EMPLOYEES_LOG 
AFTER DELETE OR INSERT OR UPDATE ON EMPLOYEES 
FOR EACH ROW 
BEGIN
  if deleting then 
   insert into employees_log
     values( :old.employee_id,sysdate,'d',user);
  elsif updating then
   insert into employees_log
     values( :old.employee_id,sysdate,'u',user);
  else
   insert into employees_log
     values( :new.employee_id,sysdate,'i',user);
  end if;     
END;


desc employees_log
Name        Null Type         
----------- ---- ------------ 
EMPLOYEE_ID      NUMBER(5)    
TDATE            DATE         
TTYPE            CHAR(1)      
TUSER            VARCHAR2(10) 
