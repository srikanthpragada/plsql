set serveroutput on
declare
  v_min_deptno departments.department_id%type;
  v_id         departments.department_id%type;
  v_max_deptno departments.department_id%type;
  v_name       departments.department_name%type;
  v_manager_id departments.manager_id%type;
  v_manager    employees.first_name%type;
begin
  select min(department_id), max(department_id) into v_min_deptno, v_max_deptno
  from departments;
  
  v_id := v_min_deptno;
  while v_id <= v_max_deptno
  loop
      begin
        select department_name, manager_id into v_name, v_manager_id
        from departments where department_id = v_id;
        
        if v_manager_id is null then
          v_manager := 'NULL';
        else
          -- get HOD name 
          select first_name into v_manager
          from employees where employee_id = v_manager_id;
        end if;
        
        
        dbms_output.put_line( rpad(v_name,30) ||  v_manager);
      exception 
        when others then
         null;
      end;
        
      v_id := v_id + 10;
  end loop;
   
end;    
    
