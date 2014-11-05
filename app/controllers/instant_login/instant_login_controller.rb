require_dependency "instant_login/application_controller"

module InstantLogin
  class InstantLoginController < ApplicationController
    def generate_token
      user = User.find_by(email: params[:email])
      if user
        user.generate_instant_login_token
        UserMailer.token(user).deliver
        redirect_to '/', notice: 'LoginEmail sent'
      else
        redirect_to '/', notice: 'No User found'
      end
    end

    def login
      user = User.find_by_instant_login_token(params[:token])
      if user
        login_user(user)
        redirect_to '/', notice: 'Logged in'
      else
        redirect_to '/', notice: 'Logged failed'
      end
    end

    private

      def login_user(user)
        session[:user_id] = user.id
      end
  end
end
