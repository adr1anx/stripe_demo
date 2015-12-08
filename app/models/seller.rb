class Seller < ActiveRecord::Base
  has_many :products
  
  validates :provider, presence: true
  validates :uid, presence: true
  validates :access_code, presence: true
  validates :publishable_key, presence: true
end
