# frozen_string_literal: true

require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)
require "heroicon"

module Dummy
  class Application < Rails::Application
    config.load_defaults "#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}".to_f

    if Rails::VERSION::MAJOR == 5
      config.active_record.sqlite3.represent_boolean_as_integer = true
    end
  end
end
