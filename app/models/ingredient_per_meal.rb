class IngredientPerMeal < ActiveRecord::Base
    belongs_to :meal
    belongs_to :ingredient
end
