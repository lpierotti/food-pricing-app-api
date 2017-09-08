class RecipesController < ApplicationController

	def find_recipe
		recipe = params[:recipe]
		response = HTTParty.get("http://food2fork.com/api/search?key=47a822139145268133384616183e0dd2&q=#{recipe}")
		json = JSON.parse(response, {symbolize_names: true})
		recipe_id = json[:recipes][0][:recipe_id]
		response = HTTP.get("http://food2fork.com/api/get?key=47a822139145268133384616183e0dd2&rId=#{recipe_id}")
		selected_recipe = JSON.parse(response, {symbolize_names: true})
		selected_recipe[:recipe][:ingredients]
	end

end
