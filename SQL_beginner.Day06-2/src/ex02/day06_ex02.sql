SELECT person.name, menu.pizza_name, menu.price, (menu.price - (menu.price * person_discounts.discount/100) ) AS discount_price, pizzeria.name AS pizzeria_name
FROM person_order 
JOIN menu ON menu.id = person_order.menu_id
JOIN person ON person.id = person_order.person_id
JOIN person_discounts ON person.id = person_discounts.person_id and person_discounts.pizzeria_id = menu.pizzeria_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY 1,2