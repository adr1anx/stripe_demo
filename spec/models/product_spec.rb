require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { create(:product) }
  
  it 'must have a price greater than 0' do
    expect(build(:product, price: 0)).to_not be_valid
  end
  
  it 'is invalid without a name' do
    expect(build(:product, name: nil)).to_not be_valid
  end
  
  it 'is invalid without a description' do
    expect(build(:product, description: nil)).to_not be_valid
  end
  
  it 'should calculate a 10% app fee' do
    expect(create(:product).application_fee).to eq(234)
  end
end
