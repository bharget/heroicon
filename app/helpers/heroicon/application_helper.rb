# frozen_string_literal: true

module Heroicon
  module ApplicationHelper
    def heroicon(name, variant: Heroicon.configuration.variant, options: {})
      raw Heroicon::Icon.render(name: name, variant: variant, options: options)
    end
  end
end
