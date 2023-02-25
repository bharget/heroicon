# frozen_string_literal: true

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require "rails"
require "nokogiri"
require "heroicon"

# Rails.application.initialize!

require "minitest/pride"
require "minitest/spec"
require "mocha/minitest"

# Filter out the backtrace from minitest while preserving the one from other libraries.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

module Kernel
  alias_method :context, :describe
end

class ActiveSupport::TestCase
  extend Minitest::Spec::DSL
end
