class Event < ActiveRecord::Base
  reverse_geocoded_by :lat, :lng
  after_validation :reverse_geocode

  has_many :artists_events
  has_many :artists, through: :artists_events

  has_many :locations_events
  has_many :locations, through: :locations_events

  has_many :events_users
  has_many :users, through: :events_users

  belongs_to :venue

  scope :city,         -> (city)  { where("city ILIKE ?", city) }
  scope :state,        -> (state) { where("state ILIKE ?", state) }
  scope :display_name, -> (display_name) { where("display_name ILIKE ?", display_name) }
  scope :event_type,   -> (event_type) { where("event_type ILIKE ?",  event_type) }
  # scope :location,     -> (location) { where("location ILIKE ?", location) }
  scope :artist_name, lambda { |artist_name|
    joins(:artists_events => :artist).where('artists.display_name' => artist_name)
  }
  # scope :location, lambda { |location|
  #   joins(:locations_events => :location).where('location.latitude' => latitude, 'location.longitude' => longitude)
  # }
  scope :date_range, -> (start_date, end_date){where datetime: start_date..end_date }

  def self.location(filter_location)
    lat, lng = filter_location[4..-1].split(",")
    near([lat, lng], 100)
    #  require 'pry' ; binding.pry
  end


  def self.save_events(filtered_params)
    events = EventServices.events(filtered_params)

    parsed = JSON.parse(events)

    return false if parsed["resultsPage"]["results"].empty?

    parsed_events = parsed["resultsPage"]["results"]["event"]

    parsed_events.each do |event|
      created_event = find_or_create_by(
        display_name: event["displayName"],
        event_type:   event["type"],
        lat:          event["venue"]["lat"],
        lng:          event["venue"]["lng"],
        datetime:     event["start"]["date"]
      )

      created_event.venue = Venue.find_or_create_by(
        display_name: event["venue"]["displayName"],
        lat:          event["venue"]["lat"],
        lng:          event["venue"]["lng"],
        city:         event["venue"]["metroArea"]["displayName"],
        country:      event["venue"]["metroArea"]["country"]["displayName"]
      )

      event["performance"].each do |artist|
        artist = Artist.find_or_create_by(
          display_name: artist["displayName"]
        )

        ArtistsEvent.create(artist_id: artist.id, event_id: created_event.id)
      end
    end

    return true
  end
end
