class Api::V1::IngredientsController < ApplicationController

  def find_ingredients
    ingredient_list = params[:ingredients][:searchedIngredients]
    matching_ingredients = []
    ingredient_list.each do |item|
      Ingredient.all.each do |ingredient|
        if (item.split(" ")-ingredient.name.split(" ")).empty?
          matching_ingredients << ingredient
          break
        end
      end 
    end
    render :json => {ingredients: matching_ingredients}
  end


end

