SET SERVEROUTPUT ON;

DECLARE
	TEST_EXCEPTION EXCEPTION;
BEGIN
	DBMS_OUTPUT.PUT_LINE('RUN1');
	RAISE TEST_EXCEPTION;
	DBMS_OUTPUT.PUT_LINE('RUN2');
EXCEPTION
	WHEN TEST_EXCEPTION THEN
		DBMS_OUTPUT.PUT_LINE('TEST EXCEPTION');
END;