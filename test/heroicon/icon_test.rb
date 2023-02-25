# frozen_string_literal: true

require "test_helper"
require "pry"

class Heroicon::IconTest < ActiveSupport::TestCase
  let(:default_args) { { name: "user", variant: :outline, options: {}, path_options: {}} }
  subject { Heroicon::Icon.new(**default_args) }

  describe "#initialize" do
    it "requires name" do
      default_args.delete(:name)
      assert_raises(ArgumentError) { Heroicon::Icon.new(**default_args) }
    end

    it "sets name" do
      assert_equal "user", subject.name
    end

    it "requires variant" do
      default_args.delete(:variant)
      assert_raises(ArgumentError) { Heroicon::Icon.new(**default_args) }
    end

    it "sets variant" do
      assert_equal :outline, subject.variant
    end

    it "sets variant to solid when invalid" do
      default_args[:variant] = :invalid
      assert_equal :solid, subject.variant
    end

    it "requires options" do
      default_args.delete(:options)
      assert_raises(ArgumentError) { Heroicon::Icon.new(**default_args) }
    end

    it "requires path_options" do
      default_args.delete(:path_options)
      assert_raises(ArgumentError) { Heroicon::Icon.new(**default_args) }
    end
  end

  describe "#render" do
    it "returns a Nokogiri::HTML::DocumentFragment" do
      assert_kind_of Nokogiri::HTML::DocumentFragment, subject.render
    end

    context "default class present" do
      context "disable_default_class is true" do
        it "disables prepending the class" do
          Heroicon.configuration.stubs(:default_class).returns({solid: "foobar"})
          subject.options[:disable_default_class] = true
          subject.options[:class] = "custom_class"
          assert_equal "custom_class", subject.render.at_css("svg").attributes["class"].value
        end
      end

      context "default class is a hash" do
        it "prepends the default variant class" do
          Heroicon.configuration.stubs(:default_class).returns({solid: "foobar"})
          subject.stubs(:variant).returns(:solid)
          assert_equal "foobar", subject.render.at_css("svg").attributes["class"].value
        end
      end

      context "default class is a string" do
        it "prepends the default variant class" do
          Heroicon.configuration.stubs(:default_class).returns("foobar")
          subject.stubs(:variant).returns(:solid)
          assert_equal "foobar", subject.render.at_css("svg").attributes["class"].value
        end
      end

      it "prepends a default class to the svg" do
        Heroicon.configure do |config|
          config.default_class = { solid: "h-5 w-5", outline: "h-6 w-6", mini: "h-4 w-4" }
        end

        subject.options[:class] = "foo"
        assert_equal "h-6 w-6 foo", subject.render.at_css("svg").attributes["class"].value
      end
    end

    it "puts all options on the generated svg" do
      subject.options[:foo] = "bar"
      assert_equal "bar", subject.render.at_css("svg").attributes["foo"].value
    end

    it "allows setting path stroke width" do
      subject.path_options[:stroke_linecap] = "foo"
      assert_equal "foo", subject.render.at_css("path").attributes["stroke-linecap"].value
    end

    context "name not found" do
      context "development" do
        it "renders a warning" do
          subject.stubs(name: rand.to_s)
          Rails.stubs(:env).returns(OpenStruct.new(development?: true))

          assert_match(/^<script/, subject.render.to_s)
        end
      end

      context "not development" do
        it "fails silently when name not found" do
          subject.stubs(name: rand.to_s)
          assert_nil subject.render
        end
      end
    end

    describe "#to_s" do
      it "starts with an svg tag" do
        assert_match(/^<svg/, subject.render.to_s)
      end
    end
  end
end
