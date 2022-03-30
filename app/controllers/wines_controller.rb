class WinesController < ApplicationController
  # before_action :find_wine

  def index
    @wines = Wine.all
  end

  def show
    wine = Wine.find(params[:id])
  end

  def edit
    wine = Wine.find(params[:id])
  end

  def update
    wine = Wine.find(params[:id])
    wine.update(wine_params)
    redirect_to "/wines/#{@wine.id}"
  end

  private
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

    # def find_wine
    #   @wine = Wine.find(params[:id])
    # end
end
