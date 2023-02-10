class Public::HomesController < ApplicationController
  def top
    @production_areas = ProductionArea.all
  end

  def about
    @production_areas = ProductionArea.all
  end

end
