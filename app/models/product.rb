class Product < ActiveRecord::Base
  validates :name, :presence => true
  validates :description, :presence => true
  monetize :price_cents, allow_nil: true,
    numericality: {greater_than: 0}
  
  # 10% of the price, truncated
  def application_fee
    (price_cents.to_f * 0.10).to_i
  end
end
