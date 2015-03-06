class Event < ActiveRecord::Base
  has_many :artists_events
  has_many :artists, through: :artists_events

  belongs_to :venue

  scope :city,         -> (city)  { where city: city }
  scope :state,        -> (state) { where state: state }
  scope :display_name, -> (display_name) { where display_name: display_name}
  scope :event_type,   -> (event_type) { where event_type: event_type }
  scope :location,     -> (location) { where location: location}
  scope :artist, lambda { |artist_name|
    #  where('artists.display_name = ?', artist_name).joins(:artists)
     where(artists: { display_name: artist_name } )
     }
  # Create a migration that deletes the artist_id
  # create a join table for artists and events
end
