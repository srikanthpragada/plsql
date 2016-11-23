set serveroutput on 
declare
  cursor deptcur is
   select * from departments
   where department_id in (select department_id from employees)
   order by 2;
   
  cursor empcur(p_dept number)is 
    select first_name
    from employees
    where department_id = p_dept;
begin
    for deptrec in deptcur
    loop
        dbms_output.put_line(deptrec.department_name);
        for emprec in empcur(deptrec.department_id)
        loop
           dbms_output.put_line('****' || emprec.first_name);
        end loop;
        
   end loop;
end;   
        
            
