class Product < ActiveRecord::Base
  validates :name, :presence => true
  validates :description, :presence => true
  monetize :price_cents, allow_nil: true,
    numericality: {greater_than: 0}
  
end
