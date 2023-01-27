class Public::RecipesController < ApplicationController
  def index
    @recipe = Recipe.where(status: 1).page(params[:page]).per(8)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_comment = RecipeComment.new
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(recipe_params)
    recipe.user_id = current_user.id
    if recipe.save
      redirect_to recipe_path(recipe), notice:  "登録が完了しました"
    else
      flash.now[:error] = "空欄があります"
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe.id), notice: "変更が完了しました"
    else
      flash.now[:error] = "空欄があります"
      render :edit
    end
  end

  def destroy
  end

  private

  def recipe_params
    params.require(:recipe).permit(:user_id, :production_area_id, :name, :coffee_beans_name, :roast, :amount,
    :grind, :temperature, :total_pouring_amount, :extraction_amount, :total_extraction_time, :dripper, :paper, :point, :status, :image)
  end

end
