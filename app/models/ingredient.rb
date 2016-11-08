class Ingredient < ActiveRecord::Base
    has_many :ingredient_per_meals, foreign_key: "ingredient_id"
    has_many :meals, through: :ingredient_per_meals
end
