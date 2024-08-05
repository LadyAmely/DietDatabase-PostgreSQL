CREATE OR REPLACE FUNCTION add_user_related_data()
RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO HealthProfiles (UserID, Height, Weight, BMI, MedicalConditions, ActivityLevel)
    VALUES (NEW.UserID, NULL, NULL, NULL, NULL, NULL);

    INSERT INTO Allergies (UserID, IngredientID)
    VALUES (NEW.UserID, NULL); 

    INSERT INTO Preferences (UserID, DietType, FavoriteCuisines, DislikedFoods)
    VALUES (NEW.UserID, NULL, NULL, NULL);
END;

$$ LANGUAGE plpgsql;

CREATE TRIGGER add_user
AFTER INSERT ON Users
FOR EACH ROW
EXECUTE FUNCTION add_user_related_data();






