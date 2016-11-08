Rails.application.routes.draw do
    resources :orders, path: 'ordenes' do
       resources :details, path: 'detalles'
       collection do
           get 'closed_list'
       end
   end

   resources :meals, path: 'platillos' do
       resources :ingredients_per, path: 'ingredientes_de'
   end

   resources :ingredients, path: 'ingredientes'

   post "ordenes/:order_id/detalles/agregar" => "details#add_meal", as: :add_meal
   post "ordenes/:order_id/detalles/:id/editar" => "details#change_meal", as: :change_meal
   get "cerrar_orden/:id" => "orders#close_an_order", as: :close_order

   post "platillos/:meal_id/ingredientes_de/agregar" => "ingredients_per#add_ingredient", as: :add_ingredient
   post "platillos/:meal_id/ingredientes_de/:id/editar" => "ingredients_per#change_ingredient", as: :change_ingredient

   root "orders#index"
end
