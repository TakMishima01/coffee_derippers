class Admin::RecipeCommentsController < ApplicationController
  before_action :authenticate_admin!, except: [:admin_session_path]

  def destroy
    RecipeComment.find(params[:id]).destroy
    redirect_to admin_recipe_path(params[:recipe_id])
  end

  private

 def admin_scan
   unless current_user.admin?
     redirect_to root_path   #管理者以外が管理者のみ実行できるアクションを実行しようとしたときのリダイレクト先
   end
 end

end
