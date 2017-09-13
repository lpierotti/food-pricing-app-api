Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/recipes', to: 'recipes#find_recipe'
      post '/restaurants', to: 'restaurants#find_restaurants'
      post '/menus', to: 'menus#find_menu'
      post '/ingredients', to: 'ingredients#find_ingredients'
      post '/signup', to: 'users#create'
      post '/login', to: 'auth#create'
      get '/user/recipes', to: 'users#user_recipes'
      post '/recipes/new', to: 'recipes#create'
    end
  end
end
