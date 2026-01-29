CREATE UNIQUE INDEX idx_person_discounts_unique on person_discounts(person_id, pizzeria_id);

SET enable_seqscan = OFF;
explain analyse
SELECT *
FROM person_discounts
WHERE person_id = 1 AND pizzeria_id = 12;