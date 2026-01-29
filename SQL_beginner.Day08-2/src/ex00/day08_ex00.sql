-- S1
BEGIN;

UPDATE pizzeria 
SET rating = 5 
WHERE name = 'Pizza Hut';

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- S2
SELECT * 
FROM pizzeria
WHERE name = 'Pizza Hut';

-- S1
COMMIT;

-- S2
SELECT * 
FROM pizzeria
WHERE name = 'Pizza Hut';