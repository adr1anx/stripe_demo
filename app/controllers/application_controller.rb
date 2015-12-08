class ApplicationController < ActionController::Base
  helper_method :current_seller, :seller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_seller
    @current_seller ||= Seller.find_by(id: session[:seller_id])
  end
  
  def seller?
    current_seller != nil
  end
  
  def seller_present
    redirect_to "/auth/stripe_connect/" and return false unless seller?
    return true
  end
end
