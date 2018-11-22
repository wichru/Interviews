SELECT items.name AS item, sellers.name AS seller
FROM items
JOIN sellers ON sellers.id = items.seller_id
GROUP BY items.name, sellers.name, sellers.rating
HAVING sellers.rating > 3
ORDER BY item;
