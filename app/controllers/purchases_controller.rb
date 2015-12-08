class PurchasesController < ApplicationController
  before_action :seller_present

  def create
    # look up the product for pricing and fee values
    @product = Product.find(params[:product][:id])
    
    begin
      token = params[:stripeToken]
      
      @charge = Stripe::Charge.create({
          :amount => @product.price_cents,
          :currency => "usd",
          :source => token,
          :description => "Purchase for #{@product.name}",
          :application_fee => @product.application_fee
        },
          { :stripe_account => current_seller.uid }
        )
        
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to product_path(@product)
      
    rescue Stripe::AuthenticationError => e
      flash[:error] = e.message
      redirect_to product_path(@product)
      
    end
  end
end
