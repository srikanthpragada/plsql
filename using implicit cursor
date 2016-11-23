set serveroutput on 
begin
   update employees set salary = 5000
   where  department_id = 200;
   
   if sql%found then
       dbms_output.put_line('Updated ' || sql%rowcount || ' employees!');
       rollback;
   else
       dbms_output.put_line('Employee not found!');
   end if;
   
end;   
