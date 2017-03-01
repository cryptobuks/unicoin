class BuyersController < ApplicationController

  def show
    @buyer = Buyer.find(params[:id])
    @transactions = @buyer.transactions
  end

end
