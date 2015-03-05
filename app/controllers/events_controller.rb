class EventsController < ApplicationController

  def index
    @event = Event.all
    @event = Event.find_by(params[:event_id])
  end
end
