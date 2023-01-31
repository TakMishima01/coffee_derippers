class Public::MyRecipesController < ApplicationController

  def create
    recipe = Recipe.find(params[:recipe_id])
    my_recipe = current_user.my_recipes.new(recipe_id: recipe.id)
    my_recipe.save
    redirect_to recipe_path(recipe)
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    my_recipe = current_user.my_recipes.find_by(recipe_id: recipe.id)
    my_recipe.destroy
    redirect_to recipe_path(recipe)
  end

end
