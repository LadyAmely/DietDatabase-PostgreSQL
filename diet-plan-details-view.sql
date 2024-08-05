CREATE VIEW DietPlansDetails AS
SELECT d.name_plan, d.diet_type, d.description, m.name_meal, m.meal_type
FROM DietPlans d
INNER JOIN Meals m ON d.diet_id = m.diet_id;
