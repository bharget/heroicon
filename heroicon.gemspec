# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "heroicon/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name = "heroicon"
  spec.version = Heroicon::VERSION
  spec.authors = ["Benjamin Hargett"]
  spec.email = ["hargettbenjamin@gmail.com"]
  spec.homepage = "https://github.com/bharget/heroicon"
  spec.summary = "Rails View Helpers for Heroicons."
  spec.description = "Ruby on Rails view helpers for the beautiful hand-crafted SVG icons, Heroicons."
  spec.license = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.required_ruby_version = ">= 2.5"

  spec.add_dependency "actionmailbox", ">= 5.2"
  spec.add_dependency "actionmailer", ">= 5.2"
  spec.add_dependency "actionpack", ">= 5.2"
  spec.add_dependency "actiontext", ">= 5.2"
  spec.add_dependency "actionview", ">= 5.2"
  spec.add_dependency "activejob", ">= 5.2"
  spec.add_dependency "activemodel", ">= 5.2"
  spec.add_dependency "activerecord", ">= 5.2"
  spec.add_dependency "activestorage", ">= 5.2"
  spec.add_dependency "activesupport", ">= 5.2"
  spec.add_dependency "railties", ">= 5.2"

  spec.add_development_dependency "appraisal"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-rails"
  spec.add_development_dependency "standard"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "mocha"
end
