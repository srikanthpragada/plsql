CREATE OR REPLACE TRIGGER TRG_START_DATE_CHECK 
BEFORE INSERT OR UPDATE OF START_DATE ON JOB_HISTORY 
FOR EACH ROW 
Declare 
  v_hiredate date;
BEGIN
   select  hire_date into v_hiredate
   from employees
   where employee_id = :new.employee_id;
   
   if :new.start_date < v_hiredate then
      raise_application_error(-20500,'Start_date cannot be before hire_date');
   end if; 
END;
