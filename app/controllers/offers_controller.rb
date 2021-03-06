class OffersController < ApplicationController
  def index
    @offers = Offer.all
    @buyer_offer = @offers.order(:price_per_coin).where(:status => 'Open').first
  end

  def new
  end

  def create
    @offer = Offer.new(offers_params)
    @offer.update(status: 'Open')
    @offer.seller = current_seller
    if @offer.save
      redirect_to '/offers'
    else
      render :new
    end
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(status: 'Sold')
    @buyer_offer = Offer.find(params[:id])
    @buyer_offer.update(status: 'Sold')
    @transaction = Transaction.create(buyer: current_buyer, seller: @offer.seller, offer: @offer)
    redirect_to offers_path
  end



private
  def offers_params
    params.require(:offer).permit(:number_of_coins, :price_per_coin)
  end

end
