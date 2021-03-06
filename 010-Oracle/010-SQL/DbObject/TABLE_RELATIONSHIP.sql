/*
	The Table Relation in Oracle Database is described by Contraints. 
	The Constraints would include:
	* Primary Key Constraints
	* Foreign Key Constraints
	
	The below would provide SQL for query related tables for given table
*/

-- The SQL would query the dependent tables of given table
SELECT TABLE_NAME, 
  (SELECT LISTAGG(PUC.COLUMN_NAME, ', ') WITHIN GROUP (ORDER BY PUC.POSITION, PUC.TABLE_NAME)  
    FROM USER_CONS_COLUMNS PUC 
    WHERE 
      R.CONSTRAINT_NAME = PUC.CONSTRAINT_NAME
    GROUP BY PUC.TABLE_NAME, PUC.CONSTRAINT_NAME) COLUMNS,
  (SELECT P.TABLE_NAME FROM USER_CONSTRAINTS P WHERE CONSTRAINT_TYPE = 'P' AND P.CONSTRAINT_NAME = R.R_CONSTRAINT_NAME) AS DEPENDENT_TABLE,
  (SELECT LISTAGG(COLUMN_NAME, ', ') WITHIN GROUP (ORDER BY POSITION, COLUMN_NAME) COLUMN_NAMES 
    FROM USER_CONS_COLUMNS 
    WHERE CONSTRAINT_NAME = R.R_CONSTRAINT_NAME
    GROUP BY TABLE_NAME, CONSTRAINT_NAME) AS DEPENDENT_COLUMNS
  FROM USER_CONSTRAINTS R
WHERE 
  CONSTRAINT_TYPE = 'R' 
  AND TABLE_NAME LIKE '%&TABLE_NAME%';

-- The SQL would query what tables would depends on the given table
SELECT TABLE_NAME, 
  (SELECT LISTAGG(COLUMN_NAME, ', ')
    WITHIN GROUP (ORDER BY POSITION)
    FROM USER_CONS_COLUMNS 
    WHERE USER_CONS_COLUMNS.CONSTRAINT_NAME = P.CONSTRAINT_NAME
      AND POSITION IS NOT NULL
    GROUP BY CONSTRAINT_NAME, TABLE_NAME
  ) AS COLUMNS,
  (SELECT LISTAGG(TABLE_NAME, ', ')
    WITHIN GROUP (ORDER BY TABLE_NAME)
    FROM USER_CONSTRAINTS R 
    WHERE R.CONSTRAINT_TYPE = 'R' 
    AND R.R_CONSTRAINT_NAME = P.CONSTRAINT_NAME
    GROUP BY R.R_CONSTRAINT_NAME
  )AS USED_TABLES
FROM USER_CONSTRAINTS P
WHERE P.CONSTRAINT_TYPE = 'P'
  AND TABLE_NAME IN (SELECT TABLE_NAME FROM USER_TABLES)
  AND CONSTRAINT_NAME IN (SELECT R_CONSTRAINT_NAME FROM USER_CONSTRAINTS)
  AND TABLE_NAME LIKE '%&TABLE_NAME%';
;  

-- The SQL would query the related table and specify the relation type, REQUIRE and DEPEND
SELECT TABLE_NAME AS QUERY_TABLE, 
  (SELECT P.TABLE_NAME FROM USER_CONSTRAINTS P WHERE CONSTRAINT_TYPE = 'P' AND P.CONSTRAINT_NAME = R.R_CONSTRAINT_NAME) AS REL_TABLE,
  'DEPEND' AS REL_TYPE
  FROM USER_CONSTRAINTS R
WHERE 
  CONSTRAINT_TYPE = 'R' 
  AND TABLE_NAME LIKE '%&TABLE_NAME%'
UNION 
SELECT P.TABLE_NAME AS QUERY_TABLE, R.TABLE_NAME AS REL_TABLE, 'REQUIRE' AS REL_TYPE
FROM USER_CONSTRAINTS R 
JOIN (  SELECT TABLE_NAME, CONSTRAINT_NAME
  FROM USER_CONSTRAINTS P
  WHERE P.CONSTRAINT_TYPE = 'P'
  AND TABLE_NAME LIKE '%&TABLE_NAME%') P
ON P.CONSTRAINT_NAME = R.R_CONSTRAINT_NAME
ORDER BY REL_TYPE
;