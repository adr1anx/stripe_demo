class Product < ActiveRecord::Base
  validates :name, :presence => true
  validates :description, :presence => true
  validates :price_cents, :presence => true
  monetize :price_cents
  
end
