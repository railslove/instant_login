module InstantLogin
  class UserMailer < ActionMailer::Base
    default from: "from@example.com"

    def token(user)
      @user = user
      mail( to: user.email)
    end
  end
end
