SELECT menu.pizza_name, menu.price, pizzeria.name
FROM (
    SELECT id AS menu_id
    FROM menu
    EXCEPT
    SELECT menu_id
    FROM person_order) AS table_menu
JOIN menu ON table_menu.menu_id = menu.id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY 1,2