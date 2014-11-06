class CustomMailer < ActionMailer::Base
  default from: "from@example.com"

  def custom_token(user)
    @user = user
    mail( to: user.email)
  end
end
