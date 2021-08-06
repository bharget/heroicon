# frozen_string_literal: true

require "test_helper"

class Heroicon::ConfigurationTest < ActiveSupport::TestCase
  it "sets DEFAULT_VARIANT to :solid" do
    assert_equal :solid, Heroicon::Configuration::DEFAULT_VARIANT
  end

  it "sets variant to the DEFAULT_VARIANT" do
    assert_equal :solid, Heroicon::Configuration.new.variant
  end
end
