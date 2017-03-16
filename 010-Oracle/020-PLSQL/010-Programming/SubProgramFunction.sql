set serveroutput on;

declare 
    function a_function(var1 varchar2)
        return varchar2
    is
    BEGIN
        return 'A Function ' || var1;
    end;
    
begin
    dbms_output.put_line(a_function('Tech Office'));
end;
    