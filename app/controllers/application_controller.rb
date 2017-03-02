class ApplicationController < ActionController::Base
  # before_action :authenticate_seller!
  # before_action :authenticate_buyer!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :verify_seller!, unless: :devise_controller?

  protect_from_forgery with: :exception

  def verify_seller!
    start_verification if requires_verification?
  end

  def requires_verification?
    if current_seller
      session[:verified].nil? && !current_seller.phone_number.blank?
    else
      false
    end
  end

  def start_verification
    result = Nexmo::Client.new.send_verification_request(
      number: current_seller.phone_number,
      brand: "Unicoin Marketplace LTD",
      sender_id: 'Unicoin'
    )
    if result['status'] == '0'
      redirect_to edit_verification_path(id: result['request_id'])
    else
      sign_out current_seller
      redirect_to :new_seller_session, flash: {
        alert: 'Could not verify your number. Please contact support.'
      }
    end
  end

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number])
     devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number])
   end

   def after_sign_in_path_for(buyer_and_seller)
      offers_url
   end

end
