class Public::UsersController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update, :show]


  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes.page(params[:page]).per(9)
    @production_areas = ProductionArea.all
  end

  def share_recipes
    @user = User.find(params[:id])
    @recipes = @user.recipes.where(status: true).page(params[:page]).per(9)
    @production_areas = ProductionArea.all
  end

  def my_recipes
    @user = User.find(params[:id])
    @recipes = @user.my_recipes.page(params[:page]).per(9)
    @production_areas = ProductionArea.all
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings.page(params[:page]).per(12)
    @production_areas = ProductionArea.all
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(12)
    @production_areas = ProductionArea.all
  end

  def edit
    @user = current_user
    @production_areas = ProductionArea.all
  end

  def update
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
