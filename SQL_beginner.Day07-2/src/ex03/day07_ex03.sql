SELECT sel1.name, coalesce(sel1.count, 0) + coalesce(sel2.count, 0) AS total_count
FROM (SELECT pizzeria.name, count(*)
      FROM person_visits 
      JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
      GROUP BY pizzeria.name) AS sel1 FULL JOIN

      (SELECT pizzeria.name, count(*)
      FROM person_order 
      JOIN menu ON person_order.menu_id = menu.id
      JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
      GROUP BY pizzeria.name) AS sel2 ON sel1.name = sel2.name

ORDER BY 2 DESC, 1;