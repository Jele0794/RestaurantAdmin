class DetailsController < ApplicationController
    before_action :find_detail, only: [:destroy, :edit]
    before_action :find_order, only: [:new, :add_meal, :edit, :change_meal, :destroy]

    def new
    end

    def add_meal
        @order.has_new_plate(Meal.find(params[:meal][:id]), params[:amount_of_meals])
        redirect_to @order
    end

    def edit
    end

    def change_meal
        @order.update_meal_amount(params[:meal][:id], params[:amount_of_meals])
        redirect_to @order
    end

    def destroy
        @order.cancel_order_meal(@detail.meal_id)
        redirect_to @order
    end

    private
    def find_order
        @order = Order.find(params[:order_id])
    end

    def find_detail
        @detail = OrderDetail.find(params[:id])
    end

    def detail_params
        params.require(:order_detail).permit(:amount_of_meals, :meal_id)
    end
end
