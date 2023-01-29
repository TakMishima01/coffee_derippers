class Admin::RecipesController < ApplicationController

  def index
    @recipes = Recipe.page(params[:page]).per(10)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
  end

end
