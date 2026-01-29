-- S1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- S2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- S1
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- S2
UPDATE pizzeria
SET rating = 3.0
WHERE name = 'Pizza Hut';
COMMIT;

-- S1
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
COMMIT;

-- S1
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- S2
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';