# frozen_string_literal: true

require "test_helper"

class Heroicon::IconTest < ActiveSupport::TestCase
  let(:default_args) { {name: "user", variant: :outline, options: {}, path_options: {}} }
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

    it "sets a default class on the generated svg" do
      assert_equal "h-6 w-6", subject.render.at_css("svg").attributes["class"].value
    end

    it "puts all options on the generated svg" do
      subject.options[:foo] = "bar"
      assert_equal "bar", subject.render.at_css("svg").attributes["foo"].value
    end

    it "allows setting path stroke width" do
      subject.path_options[:stroke_width] = "foo"
      assert_equal "foo", subject.render.at_css("path").attributes["stroke-width"].value
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
