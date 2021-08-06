# frozen_string_literal: true

require "test_helper"

module Heroicon
  class Test < ActiveSupport::TestCase
    it "is a module" do
      assert_kind_of Module, Heroicon
    end

    it "has a version" do
      assert_kind_of String, Heroicon::VERSION
    end

    it "isolates namespace for engine" do
      assert_equal "heroicon", Heroicon::Engine.engine_name
    end

    it "sets #root to the current directory" do
      assert_equal Pathname.new(Dir.pwd).to_s, Heroicon.root
    end
  end
end
