class Order < ActiveRecord::Base
    has_many :order_details, foreign_key: "order_id"
    has_many :meals, through: :order_details

    enum status: [ :open, :closed ]

    # Create
    def has_new_plate(new_meal, *amount_of_meals)
        if self.open?
            if (amount_of_meals[0] != nil)
                amount_of_meals[0] = amount_of_meals[0].to_i
                subtotal = new_meal.precio * amount_of_meals[0]
                order_details.create(meal_id: new_meal.id, amount_of_meals: amount_of_meals[0], subtotal_per_meals: subtotal)
                i = 0
                while i < amount_of_meals[0]
                    meals.find(new_meal.id).meal_ordered
                    i += 1
                end
            else
                order_details.create(meal_id: new_meal.id, subtotal_per_meals: new_meal.precio)
                meals.find(new_meal.id).meal_ordered
            end
        end
    end

    # Read
    def self.get_open
        all.where(status: 0)
    end

    def self.get_closed
        all.where(status: 1)
    end

    def get_meal_amount(meal_consulted)
        order_details.find_by(meal_id: meal_consulted.id).amount_of_meals
    end

    # Update
    def update_meal_amount(meal_to_update_id, new_amount)
        if self.open?
            new_amount = new_amount.to_f
            meal_to_update = Meal.find_by id: meal_to_update_id
            order_details_to_update = order_details.find_by(meal_id: meal_to_update.id)
            meal = meals.find(meal_to_update.id)
            new_price = meal.precio * new_amount

            if new_amount < order_details_to_update.amount_of_meals
                meals_canceled = order_details_to_update.amount_of_meals - new_amount
                i = 0
                while i < meals_canceled
                    meal_to_update.meal_canceled
                    i += 1
                end
            else
                meals_added =  new_amount - order_details_to_update.amount_of_meals
                i = 0
                while i < meals_added
                    meal_to_update.meal_ordered
                    i += 1
                end
            end
            order_details_to_update.update_attribute(:amount_of_meals, new_amount)
            order_details_to_update.update_attribute(:subtotal_per_meals, new_price)
        end
    end

    def close_order
        self.closed!
        self.total = order_details.sum(:subtotal_per_meals)
        self.save
    end

    # Delete
    def cancel_order_meal(meal_to_cancel_id)
        if self.open?
            meal_to_cancel = Meal.find_by id: meal_to_cancel_id
            meal_to_cancel.meal_canceled
            order_details.find_by(meal_id: meal_to_cancel.id).destroy
        end
    end

end
