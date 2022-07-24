SELECT /*+ INDEX(a, idx_birthYear) */ a.* FROM PEOPLE a
WHERE birthYear > 1945