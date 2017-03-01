class SellersController < ApplicationController

  def show
    @seller = Seller.find(params[:id])
    @transactions = @seller.transactions
  end

end
