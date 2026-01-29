CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN menu ON menu.pizzeria_id = pizzeria.id
JOIN person_visits ON menu.pizzeria_id = person_visits.pizzeria_id
JOIN person ON person.id = person_visits.person_id
WHERE person.name = 'Dmitriy' AND visit_date = '2022-01-08' AND price < 800;