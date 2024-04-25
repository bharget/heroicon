# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "heroicon/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name = "heroicon-ruby"
  spec.version = Heroicon::VERSION
  spec.authors = ["Jarrett Lusso"]
  spec.email = ["jclusso@gmail.com"]
  spec.homepage = "https://github.com/jclusso/heroicon-ruby"
  spec.summary = "Rails View Helpers for Heroicons."
  spec.description = "Ruby on Rails view helpers for the beautiful hand-crafted SVG icons, Heroicons."
  spec.license = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.required_ruby_version = ">= 2.5"

  spec.add_dependency "rails", ">= 5.2"

  spec.add_development_dependency "appraisal"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-rails"
  spec.add_development_dependency "standard"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "mocha"
end
