class OrderDetail < ActiveRecord::Base
    belongs_to :order
    belongs_to :meal
    attr_accessor

    def update_subtotal
        new_subtotal = Meal.find(self.meal_id).precio * self.amount_of_meals
        self.subtotal_per_meals = new_subtotal
        self.save
    end
end
