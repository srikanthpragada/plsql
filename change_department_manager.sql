create or replace procedure change_department_manager
(p_deptid number, p_managerid number)
is
 v_deptid departments.department_id%type;
 v_count  number(1);
begin

   -- does department exist?
   select count(*) into v_count
   from departments
   where department_id = p_deptid;
   
   if  v_count = 0 then
      raise_application_error(-20100,'Department not found');
   end if;

   -- check whether employee belongs to the department in question 
   select department_id into v_deptid
   from employees
   where employee_id = p_managerid;
   
   if v_deptid <> p_deptid then
     raise_application_error(-20111,'Employee does not belong to department he is supposed to head');
   end if;   
  
   -- update departments table 
   update departments 
      set manager_id = p_managerid
   where department_id = p_deptid;
   
   
exception 
   when no_data_found then
      raise_application_error(-20110,'Employee is not found!');
end;

Calling Procedure
=================
begin
   change_department_manager(100,110);
end;
