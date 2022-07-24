ALTER TABLE SYSTEM.MOVIE STORAGE (buffer_pool keep); /* Keep movie table on cache */

/* ALTER TABLE SYSTEM.MOVIE STORAGE (buffer_pool default); /* movie table not on cache */


EXPLAIN PLAN
SET STATEMENT_ID = 'aq1' FOR
SELECT year, count(*)
FROM movie
GROUP BY year
ORDER BY year desc;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='aq1' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

SELECT P.value as PHYSICAL_READS
FROM v$mystat P, v$statname N
WHERE N.name = 'physical reads'
AND P.statistic# = N.statistic#;