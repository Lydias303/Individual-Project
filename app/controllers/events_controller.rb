class EventsController < ApplicationController

  def index
    
  end
end
















#   def index
#     @events = Event.where(nil)
#     filtering_params(params).each do |key, value|
#       @events = @events.public_send(key, value) if value.present?
#     end
#        if (params[:start_date] && params[:end_date])
#          @events = @events.date_range(params[:start_date], params[:end_date])
#       end
#     end
#
#   def show
#     @event = Event.find_by(id: params[:id])
#   end
#
#   private
#
#   def filtering_params(params)
#     params.slice(:display_name, :city, :state, :venue, :artist, :age_restiction, :popularity, :event_type)
#   end
# end

# params.delete_if {|k,v| v.nil?}
