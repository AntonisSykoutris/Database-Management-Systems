CREATE CLUSTER h (birthYear numeric(4));
CREATE INDEX idx_CbirthYear ON CLUSTER h;


CREATE TABLE people
(
	personID char(50) not null,
	personName char(50) not null,
	birthYear numeric(4),
	deathYear numeric(4)
)CLUSTER  h(birthYear);



ALTER SESSION SET OPTIMIZER_MODE = ALL_ROWS;

EXPLAIN PLAN
SET STATEMENT_ID = '3E3' FOR
SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='3E3' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;


set termout off;
timing start query3E3;
SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID FROM people p, plays pl WHERE p.personID = pl.personID and p.birthYear > 1990;
set termout on;
timing stop;
/
