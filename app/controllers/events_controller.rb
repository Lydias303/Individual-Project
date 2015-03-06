class EventsController < ApplicationController

  def index
    @events = Event.where(nil)
    filtering_params(params).each do |key, value|
      @events = @events.public_send(key, value) if value.present?
    end
  end

  def show
    @event = Event.find_by(params[:event_id])
  end

  private

  def filtering_params(params)
    params.slice(:display_name, :city, :state, :artist, :venue, :date, :age_restiction, :popularity, :event_type)
  end
end

# params.delete_if {|k,v| v.nil?}
