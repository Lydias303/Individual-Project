class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by(params[:event_id])
  end
end

# params.delete_if {|k,v| v.nil?}
