class Api::V1::RecipesController < ApplicationController
  # before_action :authorized, only: :create

	def find_recipe
		query_term = params[:recipe][:searchTerm]
		response = HTTParty.get("https://api.edamam.com/search?q=#{query_term}&app_id=87d3e4f6&app_key=091ef338fd5241717048490065af2e8b&to=1", format: :plain)
		json = JSON.parse(response, {symbolize_names: true})
		recipe_name = json[:hits][0][:recipe][:label]
		recipe_yield = json[:hits][0][:recipe][:yield]
		recipe_ingredients = json[:hits][0][:recipe][:ingredients]
    	recipe_image = json[:hits][0][:recipe][:image]
    	recipe_uri = json[:hits][0][:recipe][:uri].split("_")[1]
		render :json => {ingredients: recipe_ingredients, name: recipe_name, yield: recipe_yield, image: recipe_image, recipe_uri: recipe_uri}
	end


	def create
		recipe = Recipe.find_or_create_by(reference: params[:recipe][:reference])
		UserRecipe.find_or_create_by(user_id: current_user.id, recipe_id: recipe.id)
	end

end

