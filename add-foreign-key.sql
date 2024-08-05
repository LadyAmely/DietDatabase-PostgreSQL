ALTER TABLE Ingredients
ADD COLUMN meal_id INT;

ALTER TABLE Ingredients
ADD CONSTRAINT FK_meal_id
FOREIGN KEY (meal_id)
REFERENCES Meals(meal_id);

