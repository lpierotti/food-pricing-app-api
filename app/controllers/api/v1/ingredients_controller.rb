class Api::V1::IngredientsController < ApplicationController

  def find_ingredients
    ingredient_list = params[:ingredients][:searchedIngredients]
    matching_ingredients = []
    ingredient_list.each do |item|
      Ingredient.all.each do |ingredient|
        downcased_name = ingredient.name.downcase
        if (item["name"].split(" ")-downcased_name.split(" ")).empty?
          price = (ingredient.butter_unit=="each" ? ingredient.cost_per_butter_gram : 
          item["amount"]*ingredient.cost_per_butter_gram)
          matching_ingredients << {ingredient: item["name"], price: price}
          break
        else

        end
      end 
    end
    render :json => {ingredients: matching_ingredients}
  end


end

