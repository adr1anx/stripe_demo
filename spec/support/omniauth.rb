module OmniauthMacros
  def mock_auth_hash
    OmniAuth.config.mock_auth[:stripe_connect] = OmniAuth::AuthHash.new{
      'provider' => 'stripe_connect',
      'uid' => '123545',
      'info' => {
        'name' => 'mockuser',
        'publishable_key' => 'key'
      },
      'credentials' => {
        'token' => 'mock_token'
      }
    }
  end
end