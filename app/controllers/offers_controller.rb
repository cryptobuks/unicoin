class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def new

  end

  def create
    Offer.create(offers_params)
    redirect_to '/offers'
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(status: 'Sold')
    redirect_to offers_path
  end

private
  def offers_params
    params.require(:offer).permit(:number_of_coins, :price_per_coin)
  end

end
