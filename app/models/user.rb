class User < ActiveRecord::Base
  has_many :events_users
  has_many :events, through: :user_events
  # 
  # scope :events, lambda { |liked_events|
  #   joins(:events_users => :user).where('user.event_id' => liked_events)
  # }

  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)
    user.name  = auth.info.name
    user.email = auth.info.email
    user.oauth_token = auth.credentials.token
    user.save!
    user
  end

  # def show
  #   @user = User.find(params[:id])
  # end
end
