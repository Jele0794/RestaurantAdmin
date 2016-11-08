# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

arroz = Ingredient.create!(nombre: 'Arroz',
                    descripcion: 'Semilla de la planta Oryza sativa. Se trata de un cereal considerado alimento básico',
                    cantidad: 10,
                    unidad: 'kg')
chocolate = Ingredient.create!( nombre: 'Chocolate',
                    descripcion: 'Es el alimento que se obtiene mezclando azúcar con dos productos derivados de la manipulación de las semillas del cacao',
                    cantidad: 15,
                    unidad: 'kg')

pollo = Ingredient.create!( nombre: 'Pollo',
                    descripcion: 'Animal',
                    cantidad: 30,
                    unidad: 'kg')
aceite = Ingredient.create!( nombre: 'Aceite Vegetal',
                    descripcion: 'Aceite',
                    cantidad: 30,
                    unidad: 'lt')


mole = Meal.create(nombre: 'Mole Poblano',
                    descripcion: 'Mole poblano, servido con una orden de arroz',
                    precio: 150)
arrozbl = Meal.create!(    nombre: 'Arroz Blanco',
                    descripcion: 'Orden de arroz blanco gourmet',
                    precio: 80)
caldo_pollo = Meal.create!(       nombre: 'Caldo de Pollo',
                    descripcion: 'Plato de caldo de pollo con arroz.',
                    precio: 100)

arrozid = arroz.id

mole.is_prepared_with(arroz.id, 0.5)
mole.is_prepared_with(chocolate.id, 0.2)
mole.is_prepared_with(pollo.id, 0.3)
mole.is_prepared_with(aceite.id, 0.2)

arrozbl.is_prepared_with(arroz.id, 0.3)
arrozbl.is_prepared_with(aceite.id, 0.1)

caldo_pollo.is_prepared_with(pollo.id, 0.2)
caldo_pollo.is_prepared_with(arroz.id, 0.3)
caldo_pollo.is_prepared_with(aceite.id, 0.4)


# Create Orders
order1 = Order.create!()
order2 = Order.create!()
order3 = Order.create!()

# Add meals to Order 1
order1.has_new_plate(mole, 3)
order1.has_new_plate(arrozbl)
# Add meals to Order 2
order2.has_new_plate(mole, 3)
# Add meals to Order 3
order3.has_new_plate(caldo_pollo)
order3.has_new_plate(arrozbl)
# Close order 3
# order3.close_order
# Close order 2
# order2.close_order
order2.has_new_plate(arrozbl)
# Update meal 'mole' from 1 serving to 2 from order 1
order1.update_meal_amount(mole.id, 2)
# Cancel meal 'arrozbl' from order 1
