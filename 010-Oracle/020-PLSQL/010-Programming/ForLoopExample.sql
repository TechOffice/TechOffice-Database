SET SERVEROUTPUT ON;

begin
    for i in 1..10 loop
        dbms_output.put_line('Hello World:' || i);
    end loop;
end;