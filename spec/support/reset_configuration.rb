RSpec.configure do |config|
  config.after :each do
    InstantLogin.reset_configuration!
  end
end
