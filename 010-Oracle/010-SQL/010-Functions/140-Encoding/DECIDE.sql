/*
* DECODE match the criteria and return corresponding result.
* 	Usage: DECODE(EXRR, CRITERIA1, 	RESULT1,
* 						CRITERIA2, 	RESULT2,
* 									ELSE_RESULT)
*/

SELECT DECODE(ID, '1', 'VALUE 1', 
                  '2', 'VALUE 2', 
                  '3', 'VALUE 3', 
                       'ESLE VALUE') AS VALUE
FROM (
  SELECT '1' AS ID FROM DUAL UNION 
  SELECT '2' FROM DUAL UNION 
  SELECT '3' FROM DUAL UNION 
  SELECT '4' FROM DUAL 
);