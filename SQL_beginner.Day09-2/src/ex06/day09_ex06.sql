CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar default 'Dmitriy',
                                                              pprice numeric default 500,
                                                              pdate date default '2022-01-08')
RETURNS TABLE (name varchar) AS $$
SELECT pizzeria.name AS name
FROM pizzeria
JOIN menu ON menu.pizzeria_id = pizzeria.id
JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
JOIN person ON person.id = person_visits.person_id
WHERE person.name = pperson AND price < pprice AND person_visits.visit_date = pdate;
$$ LANGUAGE SQL;