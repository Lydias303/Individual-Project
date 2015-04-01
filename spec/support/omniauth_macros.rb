module OmniauthMacros
  def mock_auth_hash
    OmniAuth.config.mock_auth[:facebook] = {
      'provider' => 'facebook',
      'uid' => '123545',
      'name' => 'Lydia',
      'token' => 'mock_token',
      'secret' => 'mock_secret'
    }
  end
end
