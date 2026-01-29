-- S1
BEGIN;

-- S2
BEGIN;

-- S1
UPDATE pizzeria
SET rating = 1
WHERE id = 1;

-- S2
UPDATE pizzeria
SET rating = 2
WHERE id = 2;

-- S1
UPDATE pizzeria
SET rating = 2
WHERE id = 2;

-- S2
UPDATE pizzeria
SET rating = 1
WHERE id = 1;

-- S1
COMMIT;

-- S1
COMMIT;