class MainController < ApplicationController
  skip_before_action :verify_seller!
  # skip_before_action :authenticate_buyer!
  # skip_before_action :authenticate_seller!

  def index
    if buyer_signed_in? || seller_signed_in?
      redirect_to '/offers'
    end
  end
end
