class Admin::RecipesController < ApplicationController

  def index
    @recipes = Recipe.page(params[:page]).per(10)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @pouring_details = PouringDetail.where(recipe_id: params[:id])
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.delete
    redirect_to admin_recipes_path
  end

end
