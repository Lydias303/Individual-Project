class Event < ActiveRecord::Base
  validates :display_name, :event_type, :datetime, :age_restriction,
            :popularity, :uri, :location, :city, :lng, :lat,
            :event_id, presence: true

  has_many :artists
  has_many :venues

  scope :city,         -> (city)  { where city: city }
  scope :state,        -> (state) { where state: state }
  scope :display_name, -> (display_name) { where display_name: display_name}
  scope :event_type,   -> (event_type) { where event_type: event_type }
  scope :location,     -> (location) { where location: location}
  # Create a migration that deletes the artist_id
  # create a join table for artists and events
end
