$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "easy_tokens/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "easy_tokens"
  s.version     = EasyTokens::VERSION
  s.authors     = ["Adam Nowak"]
  s.email       = ["lubieniebieski@gmail.com"]
  s.homepage    = ""
  s.summary     = "App global tokens management and verification"
  s.description = "EasyTokens provide an interface for tokens management and also their verification. You can issue a token for external app/users and verify this token presence in a given context."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.0.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "pry"
  s.add_test_dependency "sass-rails"
end
