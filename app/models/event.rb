class Event < ActiveRecord::Base
  reverse_geocoded_by :lat, :lng
  after_validation :reverse_geocode
  # before_save :style_event_display

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
  scope :artist_name, lambda { |artist_name|
    joins(:artists_events => :artist).where('artists.display_name' => artist_name)
  }

  scope :min_date, -> (min_date){ where("datetime > ?", min_date)}
  scope :max_date, -> (max_date){ where("datetime < ?", max_date)}


  def self.location(filter_location)
    lat, lng = filter_location[4..-1].split(",")
    near([lat, lng], 100)
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

  # def style_event_display
  #
  #   artist, venue = display_name.split(" at ")
  #   venue, date = venue.split("(")
  #   date = date[0..-2]
  #   save
  # end
end
# results = Geocoder.coordinates(filtered[:location])
#
# lat = results[0]
# lng = results[1]
# location_filter = "geo:#{lat},#{lng}"
# filtered[:location] = location_filter
# filtered
# end
#
# def self.location(filter_location)
#   lat, lng = filter_location[4..-1].split(",")
#   near([lat, lng], 100)
# end
