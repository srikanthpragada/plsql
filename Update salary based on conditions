set serveroutput on
declare
  v_per number(2) := 0;
  v_count number(1);
  v_exp  number(2);
  v_city locations.city%type;
  EMPID constant number(3) := 101;
begin
  -- has job history?
  select count(*) into v_count
  from job_history
  where employee_id = EMPID;
  
  if  v_count > 0 then
     dbms_output.put_line('Has job history');
     v_per :=  10;
  end if;
  
  select city into v_city
  from  employees join departments using(department_id)
  join locations using(location_id)
  where employee_id = EMPID;
  
  if v_city = 'Seattle' then
     dbms_output.put_line('Works in Seattle');
     v_per := v_per + 10;
  end if;
  
  select floor(months_between(sysdate,hire_date) / 12) into v_exp
  from  employees
  where employee_id = EMPID;
  
  if v_exp > 10 then
     dbms_output.put_line('Has more than 10 years exp.');
     v_per := v_per + 5;
  end if;
  
  if v_per > 0 then
    dbms_output.put_line('Hike is ' || v_per);
    update employees set salary = salary + (salary * v_per /100)
    where employee_id = EMPID;
    
    rollback;
  end if;

end;  
 
