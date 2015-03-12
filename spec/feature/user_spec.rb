require "rails_helper"

describe "a logged in user can" do
  include Capybara::DSL

  before(:each) do
    visit root_path
  end


  let!(:user) do
    User.create(provider: "facebook2", name: "dana", email: "dana@gmail.com", uid: "12345", oauth_token: "12345")
  end

  # it "can see their logout button" do
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).
  #     and_return(:user)
  #
  #   expect(page).to have_content("Log Out")
  #   expect(page).to have_content("Likes")
  #   expect(current_page).to eq(root_path)
  # end

end
