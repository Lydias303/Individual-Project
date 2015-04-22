require "rails_helper"

describe "a logged in user can" do
  include Capybara::DSL

  before(:each) do
    visit root_path
  end


  let!(:user) do
    User.create(provider: "facebook2", name: "dana", email: "dana@gmail.com", uid: "12345", oauth_token: "12345")
  end
end
