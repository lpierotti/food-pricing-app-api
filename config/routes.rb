Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/recipes', to: 'recipes#find_recipe'
  post '/restaurants', to: 'restaurants#find_restaurants'
end
