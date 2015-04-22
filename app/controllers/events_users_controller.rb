class EventsUsersController < ApplicationController

  def create
    @likes = EventsUser.create(user_id: current_user.id, event_id: params[:eventsusers][:event_id])
    flash[:success] = "This Event Has Been Successfully Added!"

    redirect_to :back
  end

  def destroy
    @likes = EventsUser.destroy(params[:eventsusers][:user_id], params[:eventsusers][:event_id])
  end
end
