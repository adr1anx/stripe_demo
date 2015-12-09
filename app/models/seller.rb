class Seller < ActiveRecord::Base
  validates :provider, presence: true
  validates :uid, presence: true
  validates :access_code, presence: true
  validates :publishable_key, presence: true
end
