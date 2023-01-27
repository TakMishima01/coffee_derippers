class Public::UsersController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update, :share_recipes]


  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes.page(params[:page]).per(8)
  end

  def share_recipes
    is_matching_login_user
    @user = User.find(params[:id])
    @recipes = @user.recipes.page(params[:page]).per(8)
  end

  def edit
    is_matching_login_user
    @user = current_user
  end

  def update
    is_matching_login_user
    @user = current_user
    if @user.update(user_params)
      redirect_to user_recipes_path(current_user), notice: '変更が完了しました。'
    else
      flash.now[:error] = "空欄があります。"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :status, :image)
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to recipes_path
    end
  end

end
