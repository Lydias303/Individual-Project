class Event < ActiveRecord::Base
  has_many :artists_events
  has_many :artists, through: :artists_events

  has_many :events_users
  has_many :users, through: :events_users

  belongs_to :venue
  #
  # scope :city,         -> (city)  { where("city ILIKE ?", city) }
  # scope :state,        -> (state) { where("state ILIKE ?", state) }
  # scope :display_name, -> (display_name) { where("display_name ILIKE ?", display_name) }
  # scope :event_type,   -> (event_type) { where("event_type ILIKE ?",  event_type) }
  # scope :location,     -> (location) { where("location ILIKE ?", location) }
  # scope :artist, lambda { |artist_name|
  #   joins(:artists_events => :artist).where('artists.display_name' => artist_name)
  # }
  # scope :date_range, -> (start_date, end_date){where datetime: start_date..end_date }

  # def self.service
  #   @service ||= EventServices.new
  # end

  def self.all(artist)
    get_artist_calender(artist)
  end

  def self.event_search(options = {})
    EventServices.events(options)
  end
end
