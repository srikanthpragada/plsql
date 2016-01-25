set serveroutput on
declare
  v_deptid        departments.department_id%type := 10;
  v_max_deptid    departments.department_id%type;
  v_count         number(3);
  v_dept_name     departments.department_name%type;
  v_manager_name  employees.first_name%type;
  v_manager_id    departments.manager_id%type;
  v_found         boolean := false;
begin
  select max(department_id) into v_max_deptid
  from departments;
  
  while v_deptid <= v_max_deptid
  loop
  
     -- exclude departments with manager id null
     select manager_id into v_manager_id
     from departments
     where department_id = v_deptid;
     
     if v_manager_id is not null then
       -- find out no. of employees
       select count(*) into v_count
       from employees
       where department_id = v_deptid;
       
       if v_count < 5 then
        -- find out department details if it has less than 5 employees
        select department_name, first_name into v_dept_name, v_manager_name
        from  employees e join departments d 
        on ( d.manager_id = e.employee_id)
        where d.department_id = v_deptid;
        
        dbms_output.put_line( v_dept_name  || ' - ' || v_manager_name);
        v_found := true;
        exit;
       end if;
    end if;
    
    v_deptid := v_deptid + 10;
  end loop;
  
  if not v_found then
      dbms_output.put_line('No department found with less than 5 employees');
  end if;
end;
