/*
* ROWNUM and ROW_NUMBER
* 
* ROWNUM is a pseudocolumn for each row return by a query. It indicate the order of the result sets.
* ROW_NUMBER is used to assign a number to each row in the order sequence specifiy in order_by_clause.
*/

-- The simple query for rownum
select rownum, table_name from user_tables;

-- rownum as criteria
select table_name from user_tables where rownum < 11;

-- rownum of query with order 
select rownum, table_name from (select * from user_tables order by table_name);

-- row_number
select row_number() over (order by table_name), table_name from user_tables;

-- The rownum or row_number() could be used for pagination if necessary. In a certain condition, it would help increase the performance of a system.




