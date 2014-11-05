Rails.application.routes.draw do

  get '/sessions/instant_success' => 'sessions#instant_success'
  get '/sessions/instant_failure' => 'sessions#instant_failure'

  mount InstantLogin::Engine => "/instant_login"

  root 'pages#welcome'
end
