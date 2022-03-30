class WinemakerWinesController < ApplicationController
  before_action :find_winemaker  #, only: [:create, :update]  #do this if you want to limit the before_action

  def index
    @wines = @winemaker.wines
  end

  def new
  end

  def create
    @winemaker.wines.create(wine_params)
    redirect_to "/winemakers/#{@winemaker.id}/wines"
  end

  private
    def winemaker_params
      {
        name: params[:name],
        region: params[:region],
        public_tasting: params[:public_tasting],
        vineyard_acreage: params[:vineyard_acreage]
      }
      params.permit(:name, :region, :public_tasting, :vineyard_acreage)
    end

    def wine_params
      {
        name: params[:name],
        blend: params[:blend],
        vintage: params[:vintage],
        barrels_produced: params[:barrels_produced],
        signature_label: params[:signature_label]
      }
      params.permit(:name, :blend, :vintage, :barrels_produced, :signature_label)
    end

    def find_winemaker
      @winemaker = Winemaker.find(params[:winemaker_id])
    end
end
