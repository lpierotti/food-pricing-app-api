class Api::V1::UserRecipesController < ApplicationController

	def create
		UserRecipe.create(user_id: params[:user_id], recipe_id: params[:recipe_id])
	end
end