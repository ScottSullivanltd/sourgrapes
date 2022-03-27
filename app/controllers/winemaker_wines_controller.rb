class WinemakerWinesController < ApplicationController
  def index
    @winemaker = Winemaker.find(params[:winemaker_id])
    @wines = @winemaker.wines
  end
end
