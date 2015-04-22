require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  describe "EVENT #INDEX" do
    it "displays all events if no search has been entered" do
      get :index

      expect(response.status).to eq(200)
    end
  end
end
