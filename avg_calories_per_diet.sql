SELECT u.user_id, u.username, d.calories_per_day,
CAST(AVG(d.calories_per_day) OVER (PARTITION BY p.diet_type)AS INT) AS average_calories_per_diet
FROM Users u
JOIN Preferences p ON u.user_id = p.user_id
JOIN DietPlans d ON p.diet_type = d.diet_type
GROUP BY u.user_id, u.username, d.calories_per_day, p.diet_type
ORDER BY u.username ASC;