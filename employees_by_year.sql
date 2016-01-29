set serveroutput on
declare
  cursor empcur (p_year number) is
  select first_name from employees
  where to_char(hire_date,'yyyy') = p_year;
begin
   for year in 2000..2010
   loop
      dbms_output.put_line(year);
      dbms_output.put_line('------------------');
      
      for emprec in empcur(year)
      loop
         dbms_output.put_line( emprec.first_name);
      end loop;
      
      dbms_output.put_line('*******');
      
   end loop;
end;

   
 
