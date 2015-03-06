class Event < ActiveRecord::Base
  has_many :artists

  # Create a migration that deletes the artist_id
  # create a join table for artists and events
end
