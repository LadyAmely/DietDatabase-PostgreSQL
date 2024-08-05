CREATE VIEW dietetic_information_about_user AS
SELECT 
    u.username, 
    hp.height, 
    hp.weight, 
    hp.BMI, 
    hp.activity_level, 
    p.diet_type, 
    COUNT(a.allergy_id) AS allergy_count,
    CASE
        WHEN hp.BMI < 18.5 THEN 'Underweight'
        WHEN hp.BMI BETWEEN 18.5 AND 24.9 THEN 'Normal weight'
        WHEN hp.BMI BETWEEN 25.0 AND 29.9 THEN 'Overweight'
        ELSE 'Obesity'
    END AS BMI_Category
FROM Users u
LEFT JOIN HealthProfiles hp ON u.user_id = hp.user_id
LEFT JOIN Preferences p ON u.user_id = p.user_id
LEFT JOIN Allergies a ON u.user_id = a.user_id
GROUP BY 
    u.username, 
    hp.height, 
    hp.weight, 
    hp.BMI, 
    hp.activity_level, 
    p.diet_type
ORDER BY u.username ASC;

