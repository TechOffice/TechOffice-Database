SET SERVEROUTPUT ON;

DECLARE
	TYPE STR_VAR_TYP IS VARRAY(5) OF VARCHAR2(100);
	STR_VAR STR_VAR_TYP;
BEGIN
	STR_VAR := STR_VAR_TYP('A1', 'A2', 'A3', 'A4', 'A5');
  FOR STR IN 1.. STR_VAR.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(STR);
  END LOOP;
END;