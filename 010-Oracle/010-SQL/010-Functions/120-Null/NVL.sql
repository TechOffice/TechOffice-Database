/*
* 	NVL let you replace null string. 
* 		Usage: 
* 			NVL(EXPR1, EXPR2)
*			If EXPR1 is null, then return EXPR2. If EXPR1 is not null, then return EXPR1.
* 	NVL2 is very simliar to NVL. 
*		Usage:
* 			NVL2(EXPR1, EXPR2, EXPR3)
* 			If Expr1 is null, then return EXPR3. If EXPR1 is not null, then return EXPR2.
*/

SELECT NVL(NULL, 'NULL') FROM DUAL;
SELECT NVL2('NULL', 'NOT NULL', 'NULL') FROM DUAL;