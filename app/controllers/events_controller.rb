class EventsController < ApplicationController

  def index
    @events = Events.all
  end
end

# require 'faraday'
# key = "RknuC79GGhjfBGWp"
# conn = Faraday.new
# artist  = "weezer"
# response = conn.get "http://api.songkick.com/api/3.0/search/artists.json?query=#{artist}&apikey=#{key}"
# puts response.body













# params.delete_if {|k,v| v.nil?}
