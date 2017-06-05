declare
   v_deptid     departments.department_id%type;
   v_locationid departments.location_id%type;
   v_managerid  departments.manager_id%type;
   v_150_exp    number(5);
   v_160_exp    number(5);
begin
  
   select max(department_id) + 10 into v_deptid
   from departments;
   
   select  sysdate - hire_date into v_150_exp
   from employees where employee_id = 150;
   
   select  sysdate - hire_date into v_160_exp
   from employees where employee_id = 160;
   
   if v_150_exp > v_160_exp then
       v_managerid := 150;
   else
       v_managerid := 160;
   end if;
   
   select location_id into v_locationid
   from departments 
   where department_id = 30;
   
   insert into departments values(v_deptid,'Entertainment', v_managerid, v_locationid);
  
end;   


