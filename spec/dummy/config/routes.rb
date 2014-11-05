Rails.application.routes.draw do

  mount InstantLogin::Engine => "/instant_login"

  root 'pages#welcome'
end
