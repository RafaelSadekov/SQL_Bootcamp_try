SELECT m.pizza_name,
       m.price,
       pz.name AS pizzeria_name
FROM menu m,
     pizzeria pz
WHERE m.pizzeria_id = pz.id
    AND m.id NOT IN
        (SELECT menu_id
         FROM person_order)
ORDER BY m.pizza_name,
         m.price;

