set serveroutput on
declare
  cursor deptcur is
    select department_id, department_name
    from departments
    where department_id in (select department_id from employees)
    order by 2;
 
  v_deptid   departments.department_id%type;
  v_deptname departments.department_name%type;
  v_name     employees.first_name%type;
begin

  open deptcur;
  loop
     fetch  deptcur into v_deptid, v_deptname;
     exit when deptcur%notfound;
     
     begin 
      -- get employee with hightest experience in this dept
      select first_name into v_name
      from   employees
      where  department_id = v_deptid
      and hire_date = 
       (select min(hire_date)  from employees 
        where department_id = v_deptid );
        
      dbms_output.put_line(v_deptname || ' '  || v_name);
     exception 
       when too_many_rows then
          dbms_output.put_line(v_deptname || ' is having more than one employee');   
     end;
     
  end loop;
  close deptcur;

end;  
 
With Cursor For Loop
====================
set serveroutput on
declare
  cursor deptcur is
    select department_id, department_name
    from departments
    where department_id in (select department_id from employees)
    order by 2;
   v_name     employees.first_name%type;
begin
  for deptrec in deptcur
  loop
     begin 
      -- get employee with hightest experience in this dept
      select first_name into v_name
      from   employees
      where  department_id =  deptrec.department_id
      and hire_date = 
       (select min(hire_date)  from employees 
        where department_id =  deptrec.department_id );
        
      dbms_output.put_line(deptrec.department_name || ' '  || v_name);
     exception 
       when too_many_rows then
          dbms_output.put_line(deptrec.department_name || ' is having more than one employee');   
     end;
   end loop;
end;  
 
