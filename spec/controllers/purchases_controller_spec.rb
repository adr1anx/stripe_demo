require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do
  before(:each) do
    @product = create(:product)
    @seller = create(:seller)
    @charge = double(Stripe::Charge)
  end

  describe "POST #create" do
    it "returns http success with a seller present and a token" do
      expect(Stripe::Charge).to receive(:create).and_return(@charge)
      allow(controller).to receive(:seller_present).and_return(true)
      allow(controller).to receive(:current_seller).and_return(@seller)
      post :create, {'product' => {"id" => @product.id}, "stripeToken"=>"tok_17FXLOH3LpvOs2bMjKA8wmbX"}
      expect(response).to have_http_status(:success)
    end
    
    it "redirects to stripe auth without a seller" do
      allow(controller).to receive(:seller?).and_return(false)
      post :create, {'product' => {"id" => @product.id}, "stripeToken"=>"tok_17FXLOH3LpvOs2bMjKA8wmbX"}
      expect(response).to have_http_status(:redirect)
    end

  end

end
