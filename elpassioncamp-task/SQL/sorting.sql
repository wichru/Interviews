SELECT first_name, COUNT(*) AS name_count
FROM users
GROUP BY first_name
HAVING COUNT(*) > 1
ORDER BY name_count DESC;
