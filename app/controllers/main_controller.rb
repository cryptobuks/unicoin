class MainController < ApplicationController

  def index
    if buyer_signed_in? || seller_signed_in?
      redirect_to '/offers'
    end
  end
end
