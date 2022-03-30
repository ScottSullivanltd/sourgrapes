class WinemakersController < ApplicationController
  before_action :find_winemaker

  def index
    @winemakers = Winemaker.all
  end

  def show
  end

  def new
  end

  def create
    winemaker = Winemaker.create(winemaker_params)
    redirect_to "/winemakers"
  end

  def edit
  end

  def update
    @winemaker.update(winemaker_params)
    redirect_to "/winemakers/#{@winemaker.id}"
  end

  private
    def winemaker_params
      # don't need to do the below, yet..
      {
        name: params[:name],
        region: params[:region],
        public_tasting: params[:public_tasting],
        vineyard_acreage: params[:vineyard_acreage]
      }
      params.permit(:name, :region, :public_tasting, :vineyard_acreage)
    end

    def find_winemaker
      @winemaker = Winemaker.find(params[:id])
    end
end
