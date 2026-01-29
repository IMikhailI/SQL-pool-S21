SELECT po.order_date, person.name || ' (age:' || age || ')' AS person_information
FROM person_order po
NATURAL JOIN (SELECT p.id AS person_id, p.name, p.age FROM person p)  person
ORDER BY po.order_date, person_information;