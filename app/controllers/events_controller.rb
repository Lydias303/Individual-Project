class EventsController < ApplicationController

  def index
    @events = Event.where(nil)
    # artist = Artist.includes(:events).find_by(display_name: params[:display_name])
    # if artist
    #   @events << artist.events
    # end
    filtering_params(params).each do |key, value|
      @events = @events.public_send(key, value) if value.present?
    end
      @events = @events.date_range(params[:start_date], params[:end_date]) if (params[:start_date] && params[:end_date])
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  private

  def filtering_params(params)
    params.slice(:display_name, :city, :state, :venue, :artist, :age_restiction, :popularity, :event_type)
  end
end

# params.delete_if {|k,v| v.nil?}
