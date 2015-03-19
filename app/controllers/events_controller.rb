class EventsController < ApplicationController

  def index

    if params[:artist_name].nil? && params[:location].nil?
      @events = Event.all
    else
      events_found = Event.save_events(filtering_params(params))
      @events = Event.all
      if events_found
        filtering_params(params).each do |key, value|
          @events = @events.public_send(key, value) if value.present?
        end
      end
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def geocode_location(filtered)
    results = Geocoder.coordinates(filtered[:location])

    lat = results[0]
    lng = results[1]
    location_filter = "geo:#{lat},#{lng}"
    filtered[:location] = location_filter
    filtered
  end


  private

  def filtering_params(params)

    filtered = params.slice(:artist_name, :location, :min_date, :max_date).delete_if {|k,v| v.blank?}
    return geocode_location(filtered) if filtered[:location]
    filtered
  end
end

#
# def index
#   @events = EventServices.where(nil)
#   artist = Artist.includes(:events).find_by(display_name: params[:display_name])
#   if artist
#     @events << artist.events
#   end
#   filtering_params(params).each do |key, value|
#     @events = @events.public_send(key, value) if value.present?
#   end
# end#
#end
# params.delete_if {|k,v| v.nil?}
