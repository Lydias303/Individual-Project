Rails.application.routes.draw do

  root 'welcome#index'

  resources :events, only: [:index, :show]

  post "/event_likes", to: 'events_users#create'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get 'auth/:provider/callback', to: 'sessions#create'

end
