# frozen_string_literal: true

module Heroicon
  class Icon
    attr_reader :name, :variant, :options

    def initialize(name:, variant:, options:, path_attributes:)
      @name = name
      @variant = safe_variant(variant)
      @options = options
      @path_attributes = path_attributes
    end

    def render
      return warning unless file.present?

      doc = Nokogiri::HTML::DocumentFragment.parse(file)
      svg = doc.at_css "svg"

      @path_attributes.each do |key, value|
        attribute = key.to_s.dasherize
        svg.css("path[#{attribute}]").each do |item|
          item[attribute] = value.to_s
        end
      end

      options.each do |key, value|
        svg[key.to_s] = value
      end

      doc
    end

    private

    def safe_variant(provided_variant)
      if %i[solid outline].include?(provided_variant.to_sym)
        provided_variant
      else
        :solid
      end
    end

    def file
      @file ||= File.read(file_path).force_encoding("UTF-8")
    rescue
      nil
    end

    def file_path
      File.join(Heroicon.root, "app/assets/images/heroicon/#{variant}/#{name}.svg")
    end

    def warning
      return unless Rails.env.development?

      <<-HTML
      <script type="text/javascript">
      //<![CDATA[
      console.warn("Heroicon: Failed to find heroicon: #{name}")
      //]]>
      </script>
      HTML
    end

    class << self
      def render(**kwargs)
        new(**kwargs).render
      end
    end
  end
end
