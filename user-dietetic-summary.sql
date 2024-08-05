
SELECT *
FROM (
    SELECT 
        u.username, 
        hp.BMI, 
        hp.activity_level, 
        hp.medical_conditions, 
        p.diet_type,
        COUNT(a.allergy_id) AS allergy_count,
        CASE
            WHEN hp.BMI < 18.5 THEN 'Underweight'
            WHEN hp.BMI BETWEEN 18.5 AND 24.9 THEN 'Normal'
            WHEN hp.BMI BETWEEN 25.0 AND 29.9 THEN 'Overweight'
            ELSE 'Obesity'
        END AS BMI_category
    FROM Users u
    LEFT JOIN HealthProfiles hp ON u.user_id = hp.user_id
    LEFT JOIN Preferences p ON u.user_id = p.user_id
    LEFT JOIN Allergies a ON u.user_id = a.user_id
    WHERE hp.BMI > 25
    GROUP BY 
        u.username, 
        hp.BMI, 
        hp.activity_level, 
        hp.medical_conditions, 
        p.diet_type
    HAVING hp.activity_level = 'High'
) AS UserDieteticSummary
ORDER BY username ASC;

