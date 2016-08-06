create or replace function delete_rows(tn varchar2, cond varchar2)
return number is
begin
   execute immediate 'delete from ' || tn || ' where ' || cond;
   return sql%rowcount;  -- no. of rows deleted
exception
   when others then 
      raise_application_error(-20600,'Error : ' || sqlerrm);
      return 0;
end;

calling
=======
set serveroutput on
begin
 dbms_output.put_line( delete_rows('jobs',' job_id = ''j1'''));
end;
