(SELECT pizzeria.name, COUNT(*) AS count, 'visit' AS action_type
FROM person_visits 
JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
GROUP BY pizzeria.name
ORDER BY 2 DESC
LIMIT 3)

UNION

(SELECT pizzeria.name, COUNT(*) AS count, 'order' AS action_type
FROM person_order 
JOIN menu ON person_order.menu_id = menu.id
inner join pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY 2 DESC
LIMIT 3)
ORDER BY 3,2 DESC