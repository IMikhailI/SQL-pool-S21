CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer default 10)
RETURNS TABLE(a    bigint) AS $$
WITH RECURSIVE f (a,b) AS

(SELECT 0 AS a, 1 AS b

UNION ALL

SELECT b, a+b 
FROM f 
WHERE b<pstop)

SELECT a
FROM f;
$$ LANGUAGE SQL;