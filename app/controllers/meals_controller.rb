class MealsController < ApplicationController
    before_action :find_meal, only: [:show, :edit, :update, :destroy]
  def index
      @meals = Meal.all.order("id ASC")
  end

  def new
      @meal = Meal.new
  end

  def create
      @meal = Meal.new(meal_params)

      if @meal.save
          redirect_to meals_path
      else
          render 'new'
      end
  end

  def show
  end

  def edit
  end

  def update
    if @meal.update(meal_params)
        redirect_to @meal
    else
        render 'edit'
    end
  end

  def destroy
      @meal.destroy
      redirect_to meals_path
  end

  private
  def find_meal
      @meal = Meal.find(params[:id])
  end

  def meal_params
     params.require(:meal).permit(:nombre, :descripcion, :precio)
 end

end
