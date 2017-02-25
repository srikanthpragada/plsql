set serveroutput on
declare
   cursor deptcur is
    select  d.department_id id, department_name name, nvl(first_name,' ') manager
    from departments d left outer join employees e
    on (d.manager_id = e.employee_id);
    
   v_count number(3); 
   v_hist_count number(3); 
begin
    for deptrec in  deptcur
    loop
        select count(*) into v_count
        from employees
        where department_id = deptrec.id;
        
        select count(*) into v_hist_count
        from job_history
        where department_id = deptrec.id;
        
        dbms_output.put_line( rpad(deptrec.name,20) || rpad(deptrec.manager,15) ||  to_char(v_count,'9999') || to_char(v_hist_count,'9999'));
        
    end loop;

end;
  
