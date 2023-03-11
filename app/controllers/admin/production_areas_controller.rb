class Admin::ProductionAreasController < ApplicationController
  before_action :authenticate_admin!, except: [:admin_session_path]

  def index
    @production_areas = ProductionArea.all
    @production_area = ProductionArea.new
  end

  def create
    index
    production_area = ProductionArea.new(production_area_params)
    if production_area.save
      redirect_to '/admin/production_areas', notice: "登録が完了しました"
    else
      flash.now[:error] = "産地名を入力してください"
      render :index
    end
  end

  def edit
    @production_area = ProductionArea.find(params[:id])
  end

  def update
    @production_area = ProductionArea.find(params[:id])
    if @production_area.update(production_area_params)
      redirect_to '/admin/production_areas', notice: "変更が完了しました"
    else
      flash.now[:error] = "産地名を名を入力してください"
      render :edit
    end
  end

  private

  def production_area_params
    params.require(:production_area).permit(:name)
  end
end
