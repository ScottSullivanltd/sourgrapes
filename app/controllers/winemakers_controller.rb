class WinemakersController < ApplicationController
  def index
    @winemakers = Winemaker.all
  end

  def show
    @winemaker = Winemaker.find(params[:id])
  end

  def new
  end

  def create
    winemaker = Winemaker.create(winemaker_params)
    redirect_to "/winemakers"
  end

  private
  def winemaker_params
    {
      name: params[:name],
      region: params[:region],
      public_tasting: params[:public_tasting],
      vineyard_acreage: params[:vineyard_acreage].to_i
    }
    params.permit(:name, :region, :public_tasting, :vineyard_acreage)
  end
end
