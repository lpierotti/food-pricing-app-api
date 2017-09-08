class RecipesController < ApplicationController

	def find_recipe
		query_term = params[:recipe][:searchTerm]
		response = HTTParty.get("http://food2fork.com/api/search?key=47a822139145268133384616183e0dd2&q=#{query_term}")
		json = JSON.parse(response, {symbolize_names: true})
		recipe_id = json[:recipes][0][:recipe_id]
		response = HTTP.get("http://food2fork.com/api/get?key=47a822139145268133384616183e0dd2&rId=#{recipe_id}")
		selected_recipe = JSON.parse(response, {symbolize_names: true})
		array_of_ingredients = selected_recipe[:recipe][:ingredients]
		recipe_name = selected_recipe[:recipe][:title]
		render :json => {ingredients: array_of_ingredients, name: recipe_name}
	end

end
