class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes.page(params[:page]).per(8)
  end

  def share_recipes
    @user = User.find(params[:id])
    @recipes = @user.recipes.page(params[:page]).per(8)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: '変更が完了しました。'
    else
      flash.now[:error] = "空欄があります。"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :status, :image)
  end

end
