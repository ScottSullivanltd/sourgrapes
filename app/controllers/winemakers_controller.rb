class WinemakersController < ApplicationController
  def index
    @winemakers = Winemaker.all
  end
end
