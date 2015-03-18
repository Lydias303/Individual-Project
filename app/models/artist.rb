class Artist < ActiveRecord::Base
  before_save { |artist| artist.display_name = display_name.downcase }
  has_many :artists_events
  has_many :events, through: :artists_events
end
