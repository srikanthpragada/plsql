create or replace procedure change_salary(p_empid number, p_salary number)
is
  -- declare variables 
begin
  update employees set salary = p_salary
  where employee_id = p_empid;
  
  if sql%notfound then
     raise_application_error(-20100,'Employee Not Found');
  else
     commit;
  end if;
exception 
  when others then
    raise_application_error(-20111,'Error during salary updation : ' || sqlerrm);
end;


calling
===========
execute change_salary(115,53332000)
