class EventsController < ApplicationController

  def index

    search_response = params[:artist_name]
    if params[:artist_name].nil?
      @events = Event.all
    else
      events = EventServices.events(filtering_params(params))
      parsed = JSON.parse(events)
      parsed_events = parsed["resultsPage"]["results"]["event"]
      parsed_events.each do |event|
        created_event = Event.find_or_create_by(
          display_name: event["displayName"],
          event_type:   event["type"],
          lat:          event["venue"]["lat"],
          lng:          event["venue"]["lng"],
          datetime:     event["start"]["date"]
        )

        created_event.venue = Venue.find_or_create_by(
          display_name: event["venue"]["displayName"],
          lat:          event["venue"]["lat"],
          lng:          event["venue"]["lng"],
          city:         event["venue"]["metroArea"]["displayName"],
          country:      event["venue"]["metroArea"]["country"]["displayName"]
        )

        event["performance"].each do |artist|
          artist = Artist.find_or_create_by(
            display_name: artist["displayName"]
          )

          ArtistsEvent.create(artist_id: artist.id, event_id: created_event.id)
        end
      end

      @events = Event.all

      filtering_params(params).each do |key, value|
        @events = @events.public_send(key, value) if value.present?
      end
    end
  end

  private

  def filtering_params(params)
    params.slice(:artist_name, :location).delete_if {|k,v| v.blank?}
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
# end
#
# def show
#   @event = Event.find_by(id: params[:id])
# end
#
#end











# params.delete_if {|k,v| v.nil?}
