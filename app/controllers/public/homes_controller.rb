class Public::HomesController < ApplicationController
  def top
    @production_areas = ProductionArea.all
    @recipe_rank = Recipe.find(MyRecipe.group(:recipe_id).order('count(recipe_id) desc').limit(3).pluck(:recipe_id))
  end

  def about
    @production_areas = ProductionArea.all
  end

end
