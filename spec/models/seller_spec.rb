require 'rails_helper'

RSpec.describe Seller, type: :model do
  subject { create(:seller) }
  
  it 'is invalid without a provider' do
    expect(build(:seller, provider: nil)).to_not be_valid
  end
  
  it 'is invalid without a uid' do
    expect(build(:seller, uid: nil)).to_not be_valid
  end
  
  it 'is invalid without an access_code' do
    expect(build(:seller, access_code: nil)).to_not be_valid
  end
  
  it 'is invalid without a publishable_key' do
    expect(build(:seller, publishable_key: nil)).to_not be_valid
  end
end
