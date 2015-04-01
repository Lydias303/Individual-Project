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
            expect(User.count).to eq(1)
          end
        end
      end
