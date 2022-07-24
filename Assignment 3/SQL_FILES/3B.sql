DROP INDEX idx_birthYear;


ALTER SESSION SET OPTIMIZER_MODE = ALL_ROWS;

EXPLAIN PLAN
SET STATEMENT_ID = '3B3' FOR
SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='3B3' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;


set termout off;
timing start query3B3;
SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID FROM people p, plays pl WHERE p.personID = pl.personID and p.birthYear > 1990;
set termout on;
timing stop;
/
