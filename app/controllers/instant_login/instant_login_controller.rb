require_dependency 'instant_login/application_controller'

module InstantLogin
  class InstantLoginController < ApplicationController
    def generate_token
      if user = InstantLogin::User.find_by(email: params[:email])
        user.generate_and_deliver_token
        redirect_to '/', notice: 'Login email sent'
      else
        redirect_to '/', alert: 'User not found'
      end
    end

    def login
      if user = InstantLogin::User.authenticate_with_instant_login_token(params[:token])
        session[InstantLogin.config.session_key] = user.id
        redirect_to InstantLogin.config.success_path, notice: 'Logged in'
      else
        redirect_to InstantLogin.config.failure_path, alert: 'Login failed'
      end
    end
  end
end
