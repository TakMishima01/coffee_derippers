class Admin::UsersController < ApplicationController

  before_action :authenticate_admin!, except: [:admin_session_path]

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @recipes = Recipe.where(user_id: params[:id]).page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_user_path(@user.id), notice: "変更が完了しました"
      else
        flash.now[:error] = "空欄があります"
        render :edit
      end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :is_deleted)
  end

end
