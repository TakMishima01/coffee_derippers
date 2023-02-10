class ApplicationController < ActionController::Base
  before_action :set_search

  def set_search
    @search = Recipe.where(status: 1).ransack(params[:q])
    @search_recipes = @search.result
    @search_view = @search.result.page(params[:page]).per(8)
  end
end
