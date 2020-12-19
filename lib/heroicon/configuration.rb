# frozen_string_literal: true

module Heroicon
  class Configuration
    attr_accessor :variant

    def initialize
      @variant = :solid
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
