CREATE UNIQUE INDEX idx_movieTitle ON MOVIE(movieTitle);


EXPLAIN PLAN
SET STATEMENT_ID = '2F' FOR
SELECT m.movieID, m.movieTitle, p.companyID
FROM movie m, producedBy p
WHERE m.movieID = p.movieID and m.movieID = 0046799 and m.movieTitle = 'Boot Polish (1954)';

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='2F' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;
DROP INDEX idx_movieTitle;