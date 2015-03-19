class Location < ActiveRecord::Base
  has_many :location_events
  has_many :events, through: :locations_events

  geocoded_by :location
  before_save :set_latitude_and_longitude

  def set_latitude_and_longitude
    result = Geocoder.coordinates(location)
    self.latitude = result[0]
    self.longitude = result[1]
  end
end
