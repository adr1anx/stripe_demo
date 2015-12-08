class SessionsController < ApplicationController
  # right now sessions is only sellers connecting
  def create
    @seller = Seller.find_or_initialize_by(uid: request.env["omniauth.auth"].uid)
    @seller.provider = request.env["omniauth.auth"].provider
    @seller.access_code = request.env["omniauth.auth"].credentials.token
    @seller.publishable_key = request.env["omniauth.auth"].info.stripe_publishable_key
    @seller.name = request.env["omniauth.auth"].info.name
    @seller.save
    
    # this 'logs' the seller in
    session['seller_id'] = @seller.id
    redirect_to :back
  end
  
  def destroy
    session['seller_id'] = nil
    redirect_to :root
  end
end
