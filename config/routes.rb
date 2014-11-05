InstantLogin::Engine.routes.draw do
  get '/:token' => 'instant_login#login', as: 'login'
  post '/' => 'instant_login#generate_token', as: 'token_generation'
end
