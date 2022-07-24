EXPLAIN PLAN
SET STATEMENT_ID = '2C2' FOR
SELECT p.personID
FROM movie m, plays p
WHERE p.movieID = m.movieID and m.movieID = 0046790;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='2C2' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

set termout off;
timing start query1;
SELECT p.personID FROM movie m, plays p WHERE p.movieID = m.movieID and m.movieID = 0046790;
set termout on;
timing stop;
/