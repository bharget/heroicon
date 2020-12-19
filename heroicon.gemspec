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
  spec.summary = "Summary of Heroicon."
  spec.description = "Description of Heroicon."
  spec.license = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.required_ruby_version = ">= 2.5"

  spec.add_dependency "rails", ">= 5.2"

  spec.add_development_dependency "appraisal"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-rails"
  spec.add_development_dependency "standard"
  spec.add_development_dependency "sqlite3"
end
