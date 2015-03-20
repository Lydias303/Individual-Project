require 'rest_client'
require 'json'

class EventServices

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
    { apikey: Figaro.env.songkick_key }
  end
end
