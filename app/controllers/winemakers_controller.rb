class WinemakersController < ApplicationController
  def index
    @winemakers = Winemaker.all
  end

  def show
  end
end
