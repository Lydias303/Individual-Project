 require 'rails_helper'

 require 'spec_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "#create" do
    before(:each) do
      OmniAuth.config.mock_auth[:facebook2] = nil
    end

    scenario "it creates a user from facebook data" do
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook2] = OmniAuth::AuthHash.new({
        :provider => "facebook2",
        :info => {
          :name => "Lydia",
          :email => "lydia@gmail.com"
        },
        :uid => "12345",
        :credentials => {:token => "1423412421432"}
      })

      post :create
      expect(User.first.name).to eq("Lydia")
    end

    scenario "it doesn't create a duplicate user" do
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook2] = OmniAuth::AuthHash.new({
        :provider => "facebook2",
        :info => {
          :name => "Lydia",
          :email => "lydia@gmail.com"
        },
        :uid => "12345",
        :credentials => {:token => "1423412421432"}
      })

       post :create

       params = OmniAuth::AuthHash.new({
       "provider" => "facebook2",
       "info" => {
         "name" => "Lydia",
         "email" => "lydia@gmail.com"
       },
       "uid" => "12345",
       "credentials" => {"token" => "1423412421432"}
     })

      User.find_or_create_from_auth(params)
      #OmniAuth.config.mock_auth[:facebook2] =OmniAuth::AuthHash.new( {:provider => "facebook2", :info => {:name => "Lydia", :email => "lydia@gmail.com"}, :uid => "12345",  :credentials => {:token => "1423412421432" })
      expect(User.count).to eq(1)
    end
  end
end




# require 'rails_helper'
# require 'spec_helper'
#
# RSpec.describe SessionsController, type: :controller do
#
#   describe "access top page" do
#     include Capybara::DSL
#     before(:each) do
#       OmniAuth.config.mock_auth[:facebook] = nil
#       request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
#     end
#
#     it "can sign a user with their facebook account" do
#       OmniAuth.config.mock_auth[:facebook] = {
#         'provider' => 'facebook',
#         'uid' => '123545',
#         'name' => 'Lydia',
#         'token' => 'mock_token',
#         'secret' => 'mock_secret'
#       }
#       post :create
#       expect(assigns(:user).name).to eq("Lydia")
#       expect(page).to have_content("Login")
#       mock_auth_hash
#       click_link_or_button "Login with"
#       expect(page).to have_content("Lydia")
#       expect(page).to have_content("Log Out")
#
#
#       User.create(provider: "facebook",
#                   name: "Lydia",
#                   email: "lydia@gmail.com",
#                   uid: "123127235098235")
#       post :create
#       expect(User.count).to eq(1)
#     end
# end
# end
