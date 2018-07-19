create table dept_emp
(
 department_name varchar2(30) primary key,
 employees   varchar2(1000)
);
-------------------------------
declare
   cursor deptcur is
     select * from departments
     where exists ( select 1 from employees 
                    where departments.department_id = department_id);

   cursor empcur(p_deptid number) is
     select first_name from employees
     where department_id = p_deptid;
     
  v_emps  varchar(1000);     
begin
   delete from dept_emp;  -- empty DEPT_EMP table 
   for dept in deptcur
   loop
      v_emps := '';
      for emp in empcur(dept.department_id)
      loop
          v_emps := v_emps || emp.first_name || ',';
      end loop;
      insert into dept_emp values( dept.department_name, rtrim(v_emps,','));
   end loop;
   commit;
   dbms_output.put_line('Successfully wrote data to DEPT_EMP');
exception
   when others then
      rollback;
      dbms_output.put_line('Could not complete task due to error!');
end;   
---------------------

