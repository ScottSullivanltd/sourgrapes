class WinesController < ApplicationController
  before_action :find_wine, only: [:show, :edit, :update, :destroy]

  def index
    @wines = Wine.all
  end

  def show
  end

  def edit
  end

  def update
    @wine.update(wine_params)
    redirect_to "/wines/#{@wine.id}"
  end

  def destroy
    @wine.destroy
    redirect_to '/wines'
  end

  private

    def wine_params
      params.permit(:name, :blend, :vintage, :barrels_produced, :signature_label)
    end

    def find_wine
      @wine = Wine.find(params[:id])
    end
end
