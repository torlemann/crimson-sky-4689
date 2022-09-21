Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/chef/:id", to: 'chefs#show'
  get "/chef/:id/ingredients", to: 'chef_ingredients#index'
  
  get "/chef/:id/dishes/:id", to: 'dishes#show'
end
