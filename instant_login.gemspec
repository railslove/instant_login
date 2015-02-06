$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "instant_login/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "instant_login"
  s.version     = InstantLogin::VERSION
  s.authors     = ["Stephan Pavlovic", "Max Schulz"]
  s.email       = ["stephan@railslove.com", "max@railslove.com"]
  s.homepage    = "https://railslove.com/instant_login"
  s.summary     = "Login by e-mail. bye bye passwords"
  s.description = "Instant Login is a Rails engine that provides an login with e-mail functionality to your app. It allows you to sned one-time login tokens to your users."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.7"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
end
