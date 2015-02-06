require_dependency 'instant_login/application_controller'

module InstantLogin
  class InstantLoginController < ApplicationController
    def generate_token
      user = InstantLogin.config.user_class.find_by(email: params[:email])
      if user
        user.generate_instant_login_token
        InstantLogin.config.mailer_class.token(user).deliver
        redirect_to '/', notice: 'Login email sent'
      else
        redirect_to '/', alert: 'User not found'
      end
    end

    def login
      user = InstantLogin.config.user_class.authenticate_with_instant_login_token(params[:token])
      if user.present?
        session[InstantLogin.config.session_key] = user.id
        redirect_to InstantLogin.config.success_path, notice: 'Logged in'
      else
        redirect_to InstantLogin.config.failure_path, alert: 'Login failed'
      end
    end
  end
end
