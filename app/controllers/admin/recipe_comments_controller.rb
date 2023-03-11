class Admin::RecipeCommentsController < ApplicationController
  before_action :authenticate_admin!, except: [:admin_session_path]

  def destroy
    RecipeComment.find(params[:id]).destroy
    redirect_to admin_recipe_path(params[:recipe_id]), notice: "コメントを削除しました"
  end

end
