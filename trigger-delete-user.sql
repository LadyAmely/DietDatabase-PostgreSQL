
CREATE OR REPLACE FUNCTION delete_user_related_data()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM HealthProfiles WHERE user_id = OLD.user_id;
    DELETE FROM Allergies WHERE user_id = OLD.user_id;
    DELETE FROM Preferences WHERE user_id = OLD.user_id;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER delete_user
BEFORE DELETE ON Users
FOR EACH ROW
EXECUTE FUNCTION delete_user_related_data();




	
	
	
