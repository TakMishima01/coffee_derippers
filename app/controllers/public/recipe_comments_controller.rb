class Public::RecipeCommentsController < ApplicationController

  def create
    recipe = Recipe.find(params[:recipe_id])
    comment = current_user.recipe_comments.new(recipe_comment_params)
    comment.recipe_id = recipe.id
    if comment.save
      redirect_to recipe_path(recipe), notice: "コメントを投稿しました"
    else
      flash.now[:error] = "コメントを入力してください"
      @recipe = Recipe.find(params[:recipe_id])
      @recipe_comment = RecipeComment.new
      @production_areas = ProductionArea.all
      @pouring_details = PouringDetail.where(recipe_id: params[:id])
      render template: "public/recipes/show"
    end
  end

  def destroy
    RecipeComment.find(params[:id]).destroy
    redirect_to recipe_path(params[:recipe_id]), notice: "コメントを削除しました"
  end

  private

  def recipe_comment_params
    params.require(:recipe_comment).permit(:comment)
  end
end
