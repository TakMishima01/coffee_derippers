class Admin::RecipesController < ApplicationController

  def index
    @recipes = Recipe.page(params[:page]).per(10)
  end

  def show
  end

  def destroy
  end

end
