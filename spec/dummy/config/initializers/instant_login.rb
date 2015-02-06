InstantLogin.configure do |config|
  config.user_class = User
  config.mailer_class = InstantLogin::UserMailer
end
