# frozen_string_literal: true

module Heroicon
  class Icon
    attr_reader :name, :variant, :options

    def initialize(name:, variant:, options:)
      @name = name
      @variant = safe_variant(variant)
      @options = options
    end

    def render
      return warning unless file.present?

      doc = Nokogiri::HTML::DocumentFragment.parse(file)
      svg = doc.at_css "svg"
      svg["class"] = options[:class] if options[:class].present?

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
      @file ||= Rails.application.assets_manifest.find_sources("heroicon/#{variant}/#{name}.svg").first.force_encoding("UTF-8")
    rescue
      nil
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
      def render(*args)
        new(*args).render
      end
    end
  end
end
