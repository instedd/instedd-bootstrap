$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "instedd-bootstrap/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "instedd-bootstrap"
  s.version     = InsteddBootstrap::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of InsteddBootstrap."
  s.description = "TODO: Description of InsteddBootstrap."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency 'sass-rails', '~> 3.2'
  s.add_dependency 'bootstrap-sass', '~> 2.3.2'
  
  s.add_development_dependency 'haml-rails', '~> 0.4'
  s.add_development_dependency "sqlite3"
end