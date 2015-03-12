class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user, :likes

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def likes
    current_user.events_users.map do |like|
      Event.find(like.event_id).display_name
    end
  end

  def authorize!
    redirect_to root_path unless current_user
  end
end
