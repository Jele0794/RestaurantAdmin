class CreateSecondStage < ActiveRecord::Migration
    def change
        create_table :orders do |t|
          t.integer :status, default: 0
          t.float :total, :scale => 2

          t.timestamps
          end

        create_table :order_details do |t|
            t.belongs_to :order, :index => true
            t.belongs_to :meal, :index => true
            t.integer :amount_of_meals, default: 1
            t.float :subtotal_per_meals, :scale => 2

            t.timestamps
          end
    end
end
