require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "POST #create" do
    before(:each) do
      # @authorize = instance_double("Auth", :uid => "stripe_id", :provider => "stripe_connect", 
      #         :credentials => {:token => "token"}, :info => {:name => "adrian", :stripe_publishable_key => "pub_key"})
      # @auth = {
      #   "provider"=>"stripe_connect",
      #   "uid"=>"stripe_id",
      #   "info"=> {
      #     "scope"=>"read_write", # or "read_only"
      #     "livemode"=>false,
      #     "stripe_publishable_key"=>"pub_key",
      #   },
      #   "credentials"=> {
      #     "token"=>"token",
      #     "expires"=>false
      #   },
      #   "extra"=> {
      #     "raw_info"=> {
      #       "token_type"=>"bearer",
      #       "stripe_user_id"=>"uid1",
      #       "scope"=>"read_only",
      #       "stripe_publishable_key"=>"pub_key",
      #       "livemode"=>false
      #     }
      #   }
      # }
      OmniAuth.config.mock_auth[:stripe_connect] = {
        :provider => 'stripe_connect',
        :uid => '123545',
        :info => {
          :name => 'mockuser',
          :publishable_key => 'key'
        },
        :credentials => {
          :token => 'mock_token'
        }
      }
      request.env["omniauth.auth"] = instance_double("Auth", :uid => '12345', :provider => 'stripe_connect', 
        :info => instance_double("info", :name => "user", :stripe_publishable_key => "key"),
        :credentials => instance_double("creds", :token => "token"))
      request.env["HTTP_REFERER"] = "/products/1"
    end
    
    context "with valid stripe params" do
      it "creates a new Seller" do
        expect {
          get :create, {:provider => "stripe_connect"}
        }.to change(Seller, :count).by(1)
      end
    end
  end
end
