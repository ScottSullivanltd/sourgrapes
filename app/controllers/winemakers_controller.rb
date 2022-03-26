class WinemakersController < ApplicationController
  def index
    @winemakers = Winemaker.all
  end

  def show
    @winemaker = Winemaker.find(params[:id])
  end
end
