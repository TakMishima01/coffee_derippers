class Public::RecipesController < ApplicationController
  def index
    @production_areas = ProductionArea.all
    if params[:q].blank? && params[:production_area_id].blank?
      @title = "レシピ"
      @recipes_count = @search_recipes.count
      @recipes = @search_view
    elsif params[:q].present? && params[:production_area_id].blank?
      @title = "検索結果"
      @recipes_count = @search_recipes.count
      @recipes = @search_view
    else params[:q].blank? && params[:production_area_id].present?
      @production_area = ProductionArea.find(params[:production_area_id])
      @title = @production_area.name
      @recipes_count = @production_area.recipes.where(status: 1).count
      @recipes = @production_area.recipes.where(status: 1).page(params[:page]).per(8)
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_comment = RecipeComment.new
    @production_areas = ProductionArea.all
    @pouring_details = PouringDetail.where(recipe_id: params[:id])
  end

  def new
    @recipe = Recipe.new
    @production_areas = ProductionArea.all
    @recipe.pouring_details.build
  end

  def create
    new
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
    @production_areas = ProductionArea.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe.id), notice: "変更が完了しました"
    else
      flash.now[:error] = "空欄があります"
      @production_areas = ProductionArea.all
      render :edit
    end
  end

  def destroy
  end



  private

  def recipe_params
    params.require(:recipe).permit(:user_id, :production_area_id, :name, :coffee_beans_name, :roast, :amount, :grind, :temperature,
                                    :total_pouring_amount, :extraction_amount, :total_extraction_time, :dripper, :paper, :point, :status, :image,
                                    pouring_details_attributes: [:id, :recipe_id, :start_at, :amount, :note, :_destroy])
  end

end
