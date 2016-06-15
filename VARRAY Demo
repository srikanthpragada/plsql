create or replace type  marks_array as varray(10) of number(3);


create table students
(admno number(5,0), 
 name varchar2(20), 
 marks marks_array
);
 
   
insert into students 
 values(1,'George', marks_array(89,88));

 
select marks from students
where admno = 1
   
MARKS                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
-------------------------
HR.MARKS_ARRAY(89,88) 


create or replace function GetMarks(marks marks_array, pos number)
return number
is
begin
     return marks(pos);
end;   


select getmarks(marks,1) from students
where admno = 1

GETMARKS(MARKS,1)
-----------------
               89 
               

create or replace procedure AddMarks(p_admno number, p_marks number)
is
  v_marks  marks_array;
begin
    select marks into v_marks
    from students 
    where  admno = p_admno;
    
    v_marks.extend();
    v_marks(v_marks.last) := p_marks;
    
    update students set marks = v_marks
    where admno = p_admno;
    commit;
   
end;


execute addmarks(1,60);


MARKS                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
-------------------------
HR.MARKS_ARRAY(89,88,60) 




