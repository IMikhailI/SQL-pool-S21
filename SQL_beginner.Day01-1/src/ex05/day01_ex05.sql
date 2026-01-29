SELECT per.id AS "person.id", per.name AS "person.name", age, gender, per.address, piz.id AS "pizzeria.id", piz.name AS "pizzeria.name", rating
FROM person AS per CROSS JOIN pizzeria AS piz
ORDER BY per.id, piz.id;