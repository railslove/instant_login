InstantLogin::Engine.routes.draw do
  resource :instant_login, only: [:create, :update], controller: 'instant_login'
end
