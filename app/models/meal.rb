class Meal < ActiveRecord::Base
    has_many :ingredient_per_meals, foreign_key: "meal_id"
    has_many :ingredients, through: :ingredient_per_meals

    has_many :order_details, foreign_key: "meal_id"
    has_many :orders, through: :order_details

    # Create
    def is_prepared_with(new_ingredient_id, new_ingredient_amount)
        ingredient_per_meals.create(ingredient_id: new_ingredient_id, amount_of_ingredient: new_ingredient_amount)
    end

    # Read
    def get_ingredient_amounts(ingredient_consulted)
        ingredient_per_meals.find_by(ingredient_id: ingredient_consulted.id).amount_of_ingredient
    end

    # Update
    def meal_ordered
        ingredients.each do |ingredient|
            ingredient_amount_used = ingredient_per_meals.find_by(ingredient_id: ingredient.id).amount_of_ingredient
            new_amount = ingredient.cantidad - ingredient_amount_used
            ingredient.update_attribute(:cantidad, new_amount)
        end
    end

    def update_ingredient_amount(ingredient_to_update_id, new_amount)
        ingredient_to_update = ingredient_per_meals.find_by(ingredient_id: ingredient_to_update_id)
        ingredient_to_update.update_attribute :amount_of_ingredient, new_amount
    end

    def meal_canceled
        ingredients.each do |ingredient|
            ingrediente = Ingredient.find_by(id: ingredient.id)
            ingredient_amount_not_used = ingredient_per_meals.find_by(ingredient_id: ingredient.id).amount_of_ingredient
            new_amount = ingrediente.cantidad + ingredient_amount_not_used
            ingrediente.update_attribute(:cantidad, new_amount)
        end
    end

    # Delete
    def remove_ingredient_from_meal(ingredient_to_destroy_id)
        ingredient_per_meals.find_by(ingredient_id: ingredient_to_destroy_id).destroy
    end
end
