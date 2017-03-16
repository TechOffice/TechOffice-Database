SET SERVEROUTPUT ON;

DECLARE
	TABLE_NAME USER_TABLES.TABLE_NAME%TYPE;
	CURSOR TEST_CUR IS SELECT TABLE_NAME FROM USER_TABLES;
BEGIN
	OPEN TEST_CUR;
	LOOP 
		FETCH TEST_CUR INTO TABLE_NAME;
		DBMS_OUTPUT.PUT_LINE(TABLE_NAME);
		EXIT WHEN TEST_CUR%NOTFOUND;
	END LOOP;
	CLOSE TEST_CUR;
END;