require 'rails_helper'

RSpec.describe EventServices do
  it "events GET a response from songkick api", :vcr, record: :new_episodes do
    new_event = EventServices.events(artist_name: "weezer")
    event = new_event.first

    expect(new_event).to_not be_empty
  end

  xit "events GET a response from songkick api when searching by location", :vcr, record: :new_episodes do
    new_event = EventServices.events(min_date: "2015/06/08", max_date: "2015/09/20")
    event = new_event.first

    expect(new_event).to_not be_empty
  end

  xit "can search events GET with multiple parameters", :vcr, record: :new_episodes do
    new_event = EventServices.events(artist_name: "weezer", location: "Denver")
    event = new_event.first

    expect(new_event).to_not be_empty
  end
end
