class Api::V1::UsersController < ApplicationController

	def create

		@user = User.new(username: params[:username], password: params[:password])
		if @user.save
			payload = {user_id: @user.id}
			render json: {user: @user, jwt: issue_token(payload)}
		else

		end
	end

	def user_recipes
		recipes = current_user.recipes
		mapped_recipes = recipes.map do |recipe|
			byebug
			response = HTTParty.get("https://api.edamam.com/search?q=#{recipe.reference}&app_id=87d3e4f6&app_key=091ef338fd5241717048490065af2e8b&to=1", format: :plain)
			json = JSON.parse(response, {symbolize_names: true})
			recipe_name = json[:hits][0][:recipe][:label]
			recipe_yield = json[:hits][0][:recipe][:yield]
			recipe_ingredients = json[:hits][0][:recipe][:ingredients]
	    recipe_image = json[:hits][0][:recipe][:image]
	    recipe_uri = json[:hits][0][:recipe][:uri].split("_")[1]
		end
		render json: {recipes: mapped_recipes}
	end

end