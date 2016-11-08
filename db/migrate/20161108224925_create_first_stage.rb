class CreateFirstStage < ActiveRecord::Migration
    def change
         create_table :meals do |t|
             t.string :nombre
             t.text :descripcion
             t.float :precio, :scale => 2

             t.timestamps
           end

         create_table :ingredients do |t|
             t.string :nombre
             t.text :descripcion
             t.float :cantidad, :scale => 2
             t.string :unidad, :limit => 4

             t.timestamps
         end

         create_table :ingredient_per_meals do |t|
             t.belongs_to :meal, :index => true
             t.belongs_to :ingredient, :index => true
             t.float :amount_of_ingredient, :scale => 2

             t.timestamps
         end
     end
end
