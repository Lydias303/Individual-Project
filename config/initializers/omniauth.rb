
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1606264746264280', 'e139847d2bad5e583e3922621ef6604b'
end
