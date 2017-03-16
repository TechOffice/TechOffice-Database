set serveroutput on;

declare 
    var1 varchar2(100);
begin
    var1 := 'varable 1';
    dbms_output.put_line(var1);
    declare
        var2 varchar2(100);
    begin
        var2 := 'varable 2';
    end;
end;