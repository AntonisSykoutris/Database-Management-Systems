ANALYZE TABLE MOVIE COMPUTE STATISTICS;

EXPLAIN PLAN
SET STATEMENT_ID = '2E1' FOR
SELECT movieID, movieTitle
FROM movie
WHERE movieID != 0046778 and year > 1985;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='2E1' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;
