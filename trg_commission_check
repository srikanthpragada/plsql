// Ensures no employees in city Toronto is having commission pct
create or replace trigger  trg_commission_check
before insert or update of commission_pct
on employees
for each row
declare
  v_city  locations.city%Type;
begin
   -- find out city of employee
   select city into v_city
   from departments join locations using(location_id)
   where :new.department_id = department_id;
   
   if v_city = 'Toronto' then
       if :new.commission_pct is not null then
           raise_application_error(-20110,'No comission is allowed in Toronto');
       end if;
   end if; 
   
end;
