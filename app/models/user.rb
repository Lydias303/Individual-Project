class User < ActiveRecord::Base
  has_many :events_users
  has_many :events, through: :events_users

  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)
    user.name  = auth.info.name
    user.email = auth.info.email
    user.oauth_token = auth.credentials.token
    user.save!
    user
  end

  def user_event_like
    # User.joins(:events_users).where(["event_id = ? ", event_id])
    # Events_users.find(["event_id = ?", event_id])
  end
end
