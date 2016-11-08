class IngredientsPerController < ApplicationController
    before_action :find_ingredient_per, only: [:destroy, :edit]
    before_action :find_meal, only: [:new, :add_ingredient, :edit, :change_ingredient, :destroy]

    def new
    end

    def add_ingredient
        @meal.is_prepared_with(params[:ingredient][:id], params[:amount_of_ingredient])
        redirect_to @meal
    end

    def edit
    end

    def change_ingredient
        @meal.update_ingredient_amount(params[:ingredient][:id], params[:amount_of_ingredient])
        redirect_to @meal
    end

    def destroy
        @meal.remove_ingredient_from_meal(@ingredient_per.ingredient_id)
        redirect_to @meal
    end

    private
    def find_meal
        @meal = Meal.find(params[:meal_id])
    end

    def find_ingredient_per
        @ingredient_per = IngredientPerMeal.find(params[:id])
    end
end
