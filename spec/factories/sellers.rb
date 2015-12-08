FactoryGirl.define do
  factory :seller do
    provider "stripe_token"
    uid "tok_123456"
    access_code "afwefe223"
    publishable_key "23ffwf2"
  end

end
