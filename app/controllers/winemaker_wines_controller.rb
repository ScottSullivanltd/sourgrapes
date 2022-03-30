class WinemakerWinesController < ApplicationController
  before_action :find_winemaker  #, only: [:create, :update]  #do this if you want to limit the before_action

  def index
    if params[:sort] == 'asc'
      @wines = @winemaker.wines.sort_alphabetically
    else
      @wines = @winemaker.wines
    end
  end

  def new
  end

  def create
    @winemaker.wines.create(wine_params)
    redirect_to "/winemakers/#{@winemaker.id}/wines"
  end

  private

    def wine_params
      params.permit(:name, :blend, :vintage, :barrels_produced, :signature_label)
    end

    def find_winemaker
      @winemaker = Winemaker.find(params[:winemaker_id])
    end
end
