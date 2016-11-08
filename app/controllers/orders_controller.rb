class OrdersController < ApplicationController
    before_action :find_order, only: [:show, :edit, :update, :destroy, :close_an_order, :edit_meal_per_order]
    helper_method :cont_close_order
  def index
      @orders = Order.get_open.order("id DESC")
  end

  def closed_list
      @orders = Order.get_closed.order("id DESC")
  end

  def create
      @order = Order.new

      if @order.save
          redirect_to @order
      else
          render 'root'
      end
  end

  def show
      @order_details = @order.order_details
      @meals = @order.meals
  end

  def destroy
      @order.destroy
      redirect_to root_path
  end

  def close_an_order
      if @order.meals.size != 0
          @order.close_order
          redirect_to root_path
      else
          flash[:alert] = 'Disculpa, no se puede cerrar una orden vacía.'
          redirect_to root_path
      end
  end

  def edit_meal_per_order
      @order_details = @order.order_details
  end

  private
  def find_order
      @order = Order.find(params[:id])
  end
end
