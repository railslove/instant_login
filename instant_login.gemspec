$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "instant_login/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "instant_login"
  s.version     = InstantLogin::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of InstantLogin."
  s.description = "TODO: Description of InstantLogin."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.7"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
