require 'rails_helper'

RSpec.describe Event, type: :model do
   before(:each) do

    moe    = Artist.create(display_name: "Moe")
    primus = Artist.create(display_name: "Primus")

    event_1 = Event.create(display_name: "Primus at Wakarusa (June, 10, 2015)",
                             event_type: "Concert",
                               datetime: "2015-08-28 02:47:07",
                               location: "123 Lovely Ln.",
                                  state: "Arkansas",
                                   city: "Ozark",
                                    uri: "https://songkiq.com/?stuff=lightbulbs")


    event_2 = Event.create(display_name: "Hangout",
                             event_type: "Festival",
                               datetime: "2015-09-09 09:47:07",
                               location: "23 Kansas st.",
                                  state: "Colorado",
                                   city: "Denver",
                                    uri: "https://songkiq.com/?stuff=sweaters")

    ArtistsEvent.create(artist_id: primus.id, event_id: event_1.id)
    ArtistsEvent.create(artist_id: moe.id, event_id: event_2.id)
  end

  it "has a scope to view events by min date" do
    filtered_events = Event.min_date("09/08/2015")

    expect(filtered_events.first.display_name).to eq("Hangout")
    expect(filtered_events.first.display_name).to_not eq("wakarusa")
    expect(filtered_events.count).to eq(1)
  end

  it "has a scope to view events by max date" do
    filtered_events = Event.max_date("08/29/2015")

    expect(filtered_events.first.display_name).to eq("Primus at Wakarusa (June, 10, 2015)")
    expect(filtered_events.first.display_name).to_not eq("Hangout")
    expect(filtered_events.count).to eq(1)
  end

  it "has a scope to view events by display name" do
    filtered_events = Event.display_name("Primus at Wakarusa (June, 10, 2015)")

    expect(filtered_events.first.show_name).to eq("Wakarusa ")
    expect(filtered_events.count).to eq(1)
  end

  it "has a scope to view events by type" do
    filtered_events = Event.event_type("festival")

    expect(filtered_events.first.event_type).to eq("Festival")
    expect(filtered_events.count).to eq(1)
  end

  it "has a scope to view events by artist" do
    filtered_events = Event.artist_name("moe")

    expect(filtered_events.first.display_name).to eq("Hangout")
    expect(filtered_events.count).to eq(1)
  end
end
