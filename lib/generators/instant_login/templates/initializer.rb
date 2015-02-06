InstantLogin.configure do |config|
  config.user_class = <%= model_class_name %>
  config.mailer_class = InstantLogin::UserMailer
end
