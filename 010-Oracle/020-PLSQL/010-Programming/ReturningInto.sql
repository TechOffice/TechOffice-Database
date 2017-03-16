/*
* Returning into specifis the variable in which to to store the values returned by the statement
*/
set serveroutput on;
create table test(col1 varchar2(100), col2 varchar2(100));
declare
	temp varchar2(100);
begin
	insert into test values ('testing col1', 'testing col2') returning col1 into temp;
	dbms_output.put_line(temp);
end;
/
drop table test;