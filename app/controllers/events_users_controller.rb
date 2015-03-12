class EventsUsersController < ApplicationController

  def create
    @likes = EventsUser.create(user_id: params[:eventsusers][:user_id], event_id: params[:eventsusers][:event_id])

    redirect_to :back
  end

  def destroy
    @likes = EventsUser.destroy(params[:user_id], params[:event_id])
  end
end
