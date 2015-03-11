require 'rails_helper'

RSpec.describe Event, type: :model do
   before(:each) do

   moe    = Artist.create(display_name: "Moe")
   primus = Artist.create(display_name: "Primus")

    Event.create(age_restriction: "16",
                    display_name: "Wakarusa",
                      event_type: "Concert",
                        datetime: "2015-08-28 02:47:07",
                        location: "123 Lovely Ln.",
                           state: "Arkansas",
                            city: "Ozark")


    Event.create(age_restriction: "16",
                    display_name: "Hangout",
                      event_type: "Festival",
                        datetime: "2015-09-09 09:47:07",
                        location: "23 Kansas st.",
                           state: "Colorado",
                            city: "Denver")

  ArtistsEvent.create(artist_id: 1, event_id: 1)
  ArtistsEvent.create(artist_id: 2, event_id: 2)
  end

  it "has a scope to view events in a date range" do
    filtered_events = Event.date_range("09/08/2015", "09/10/2015")
    expect(filtered_events.first.display_name).to eq("Hangout")
    expect(filtered_events.first.display_name).to_not eq("wakarusa")
    expect(filtered_events.count).to eq(1)
  end

  it "has a scope to view events by display name" do
    filtered_events = Event.display_name("wakarusa")
    expect(filtered_events.first.display_name).to eq("Wakarusa")
    expect(filtered_events.count).to eq(1)
  end

  it "has a scope to view events by type" do
    filtered_events = Event.event_type("festival")
    expect(filtered_events.first.event_type).to eq("Festival")
    expect(filtered_events.count).to eq(1)
  end

  it "has a scope to view events by city" do
    filtered_events = Event.city("denver")
    expect(filtered_events.first.city).to eq("Denver")
    expect(filtered_events.count).to eq(1)
  end

  it "has a scope to view events by location" do
    filtered_events = Event.location("23 Kansas st.")
    expect(filtered_events.first.location).to eq("23 Kansas st.")
    expect(filtered_events.count).to eq(1)
  end

  # it "has a scope to view events by artist" do
  #   filtered_events = Event.artist("Moe")
  #   expect(filtered_events.first.artists.first.display_name).to eq("Moe.")
  #   expect(filtered_events.first.artist_id).to eq(1)
  #   expect(filtered_events.count).to eq(1)
  # end
  #
  # it "has a scope to view events by" do
  #   filtered_events = Event.location("23 Kansas st.")
  #   expect(filtered_events.first.location).to eq("23 Kansas st.")
  #   expect(filtered_events.count).to eq(1)
  # end
end
