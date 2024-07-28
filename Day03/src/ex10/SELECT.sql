SELECT 
    po.id, 
    p.name AS person_name, 
    m.pizza_name, 
    po.order_date 
FROM 
    person_order po
INNER JOIN 
    person p ON po.person_id = p.id
INNER JOIN 
    menu m ON po.menu_id = m.id
WHERE 
    m.pizza_name = 'sicilian pizza' 
    AND p.name IN ('Denis', 'Irina');
