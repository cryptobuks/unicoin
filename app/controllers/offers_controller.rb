class OffersController < ApplicationController
  def index
    @offers = Offer.all
    @buyer_offer = @offers.order(:price_per_coin).where(:status => 'Open').first
  end

  def new
  end

  def create
    @offer = Offer.create(offers_params)
    @offer.update(status: 'Open')
    redirect_to '/offers'
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(status: 'Sold')
    @buyer_offer = Offer.find(params[:id])
    @buyer_offer.update(status: 'Sold')
    redirect_to offers_path
  end



private
  def offers_params
    params.require(:offer).permit(:number_of_coins, :price_per_coin)
  end

end
