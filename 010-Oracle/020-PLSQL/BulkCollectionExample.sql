/*
* This Example show how to use bulk collect from a cursor
* 
* The advantage of bulk collection is 
* BULK COLLECT: SELECT statements that retrieve multiple rows with a single fetch, improving the speed of data retrieval
*/
SET SERVEROUTPUT ON;

CREATE TABLE TABLE1 (
COL1 VARCHAR2(100),
COL2 VARCHAR2(100),
COL3 VARCHAR2(100),
COL4 VARCHAR2(100),
COL5 VARCHAR2(100)
)

INSERT INTO TABLE1 (COL1, COL2, COL3, COL4, COL5) VALUES ('VALUE1', 'VALUE1', 'VALUE1', 'VALUE1', 'VALUE1');
INSERT INTO TABLE1 (COL1, COL2, COL3, COL4, COL5) VALUES ('VALUE2', 'VALUE2', 'VALUE2', 'VALUE2', 'VALUE2');
INSERT INTO TABLE1 (COL1, COL2, COL3, COL4, COL5) VALUES ('VALUE3', 'VALUE3', 'VALUE3', 'VALUE3', 'VALUE3');
INSERT INTO TABLE1 (COL1, COL2, COL3, COL4, COL5) VALUES ('VALUE4', 'VALUE4', 'VALUE4', 'VALUE4', 'VALUE4');
INSERT INTO TABLE1 (COL1, COL2, COL3, COL4, COL5) VALUES ('VALUE5', 'VALUE5', 'VALUE5', 'VALUE5', 'VALUE5');

COMMIT;

DECLARE
	TYPE TABLE1_TYPE IS TABLE OF TABLE1%ROWTYPE;
	L_TABLE1 TABLE1_TYPE;
	CURSOR TABLE1_CURSOR IS SELECT * FROM TABLE1;
BEGIN
	OPEN TABLE1_CURSOR;
	LOOP
		FETCH TABLE1_CURSOR BULK COLLECT INTO L_TABLE1 LIMIT 2;
		DBMS_OUTPUT.PUT_LINE('BULK COLLECT COUNT: ' || L_TABLE1.COUNT);
		EXIT WHEN L_TABLE1.COUNT < 2;
	END LOOP;
	CLOSE TABLE1_CURSOR;
END;

DROP TABLE TABLE1;


-- Output:
-- anonymous block completed
-- BULK COLLECT COUNT: 2
-- BULK COLLECT COUNT: 2
-- BULK COLLECT COUNT: 1
