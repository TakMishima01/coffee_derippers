class Admin::RecipeCommentsController < ApplicationController
  def destroy
    RecipeComment.find(params[:id]).destroy
    redirect_to admin_recipe_path(params[:recipe_id])
  end
end
