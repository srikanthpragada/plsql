set serveroutput on
begin
   update employees set department_id = 10, hire_date = null
   where employee_id = 120;
exception 
   when others then
    if  sqlcode = -2291 then  -- parent not found 
     dbms_output.put_line('Department Id is not found');
    elsif sqlcode = -1407 then  -- null value in not null column
     dbms_output.put_line('Null is not allowed in HIRE_DATE');
    else
     dbms_output.put_line('Error : ' || sqlerrm);
    end if; 
end;   
