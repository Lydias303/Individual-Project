require 'rest_client'
require 'json'

class EventServices

  # def self.get_artist_calendar(artist)
  #   key = ENV["SONGKICK_KEY"]
  #   songkick_artist = "http://api.songkick.com/api/3.0/search/artists.json"
  #   results = RestClient.get songkick_artist, {:params => {"query" => artist, "apikey" => key} }
  #   results = JSON.parse(results)
  #   artist_id = results["resultsPage"]["results"]["artist"].first["id"]
  #   songkick_artist_calendar = "http://api.songkick.com/api/3.0/artists/#{artist_id}/calendar.json"
  #   artist_calendar = RestClient.get songkick_artist_calendar, {:params => {"apikey" => key}}
  #   artist_calendar
  # end

  def self.events( options = {})
    songkick_events = "http://api.songkick.com/api/3.0/events.json"
    RestClient.get songkick_events, event_params(options)
  end

  private

  def self.event_params(options)
    output = Hash.new
    output["params"] = defaults.merge(options).reject { |k,v| v.nil? }
    output
  end

  def self.defaults
    { apikey: ENV["SONGKICK_KEY"]}
  end


  # def self.prepare
  #   Songkickr::Remote.new(ENV["SONGKICK_KEY"])
  # end
  #
  # def self.basic_search(type="festival", artist_name=nil)
  #   prepare.events(type: type, artist_name: artist_name).results
  # end
  # def self.events(artist_name=nil, event_name=nil)
  #   songkick_events = "http://api.songkick.com/api/3.0/events.json"
  #   RestClient.get songkick_events,
  #   { params:
  #     {
  #       apikey: ENV["SONGKICK_KEY"],
  #       artist_name: method(artist_name),
  #       event_name: event_name
  #
  #     }
  #   }
  # end
  #
  # def self.event_params(event_name, artist_name, location)
  #
  #   if !event_name.nil? && !location.nil? && artist_name.nil?
  #     { params:
  #       { apikey: ENV["SONGKICK_KEY"],
  #         method
  #         # event_name: event_name,
  #         # artist_name: artist_name,
  #         # location: "ip:#{location}"
  #       }
  #     }
  #   elsif !artist_name.nil? && !location.nil?
  #     { params:
  #       {
  #         apikey: ENV["SONGKICK_KEY"],
  #         artist_name: artist_name,
  #         location: "ip:#{location}"
  #       }
  #     }
  #   elsif !artist_name.nil?
  #     { params:
  #       {
  #         apikey: ENV["SONGKICK_KEY"],
  #         artist_name: artist_name,
  #       }
  #     }
  #   end
  # end
  #
  # def self.method(artist_name)
  #   if !artist_name.nil?
  #     output = "#{artist_name}"
  #   end
  #   output
  # end
end
