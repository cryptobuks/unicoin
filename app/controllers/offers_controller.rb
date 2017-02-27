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

private
  def offers_params
    params.require(:offer).permit(:number_of_coins, :price_per_coin)
  end

end
