$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "instedd-bootstrap/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "instedd-bootstrap"
  s.version     = InsteddBootstrap::VERSION
  s.authors     = ["Santiago Palladino", "Martin Scebba", "InSTEDD"]
  s.email       = ["spalladino@manas.com.ar", "mscebba@manas.com.ar", "info@instedd.org"]
  s.homepage    = "https://bitbucket.org/instedd/instedd-bootstrap"
  s.summary     = "Bootstrap theme for all InSTEDD platform applications"
  s.description = "InSTEDD Bootstrap is a mountable engine based on bootstrap-sass which provides a Bootstrap theme for all InSTEDD platform applications."

  s.files = Dir["{app,config,lib}/**/*"] + ["LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'bootstrap-sass', '~> 2.3.2'
  s.add_dependency "rails"
  s.add_dependency 'sass-rails'
  s.add_dependency 'bootstrap-sass'

  s.add_development_dependency 'sass', '3.4.1'
  s.add_development_dependency 'haml-rails'
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "licit"
end
