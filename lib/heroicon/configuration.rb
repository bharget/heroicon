# frozen_string_literal: true

module Heroicon
  class Configuration
    DEFAULT_VARIANT = :solid

    attr_accessor :variant
    attr_accessor :default_class

    def initialize
      @variant = DEFAULT_VARIANT
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(config)
    @configuration = config
  end

  def self.configure
    yield configuration
  end
end
