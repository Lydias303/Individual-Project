require 'rails_helper'

RSpec.describe EventServices do
  it "events GET a response from songkick api", :vcr, record: :new_episodes do
    new_event = EventServices.events(artist_name: "weezer")
    event = new_event.first

    expect(new_event).to_not be_empty
  end

  it "can search events GET with multiple parameters", :vcr, record: :new_episodes do
    new_event = EventServices.events(artist_name: "weezer", min_date:  )
    event = new_event.first

    expect(new_event).to_not be_empty
  end
end
