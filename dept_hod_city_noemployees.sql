set serveroutput on
declare
   cursor deptcur is
     select  * from departments
     where manager_id is not null;
  
  function employees_count(p_deptid number) 
  return number
  is
     v_count number(3);
  begin
      select count(*) into v_count
      from employees
      where department_id = p_deptid;
      
      return v_count;
  end;
  
  function hod_name(p_deptid number) 
  return varchar2
  is
     v_name employees.first_name%type;
  begin
      select first_name into v_name
      from employees
      where employee_id  = 
        (select manager_id from departments where department_id = p_deptid);
      
      return v_name;
  end;
  
  function dept_city(p_deptid number) 
  return varchar2
  is
     v_city locations.city%type;
  begin
      select city into v_city
      from locations
      where location_id  = 
        (select location_id from departments where department_id = p_deptid);
      return v_city;
  end;
  
 begin
   for deptrec in deptcur
   loop
         dbms_output.put_line( rpad(deptrec.department_name,20) || 
                   rpad(hod_name(deptrec.department_id),20) ||
                   rpad(dept_city(deptrec.department_id),20) || 
                   employees_count(deptrec.department_id));
   end loop; 
end;
