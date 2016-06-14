create or replace trigger trg_dept_manager_check
before insert or update 
on departments
for each row
declare
   v_deptid departments.department_id%type;
begin
   -- find out department id of manager
   select department_id into v_deptid
   from employees
   where employee_id = :new.manager_id;
   
   if  v_deptid <> :new.department_id  then 
       raise_application_error(-20150,'Employee cannot head department that he/she does not belong to');
   end if;
  
end;


-- change that trigger error 
update departments set manager_id = 125
where department_id = 60


 
