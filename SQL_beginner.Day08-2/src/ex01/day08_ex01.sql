-- S1
BEGIN;

-- S2
BEGIN;

-- S1
SELECT * 
FROM pizzeria 
WHERE name = 'Pizza Hut';

-- S2
SELECT * 
FROM pizzeria 
WHERE name = 'Pizza Hut';

-- S1
UPDATE pizzeria 
SET rating = 4 
WHERE name = 'Pizza Hut';

-- S2
UPDATE pizzeria 
SET rating = 3.6 
WHERE name = 'Pizza Hut';

-- S1
COMMIT;

-- S2
COMMIT;

-- S1
SELECT *
FROM pizzeria 
WHERE name = 'Pizza Hut';

-- S2
SELECT *
FROM pizzeria 
WHERE name = 'Pizza Hut';