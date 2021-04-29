# frozen_string_literal: true

module Heroicon
  module ApplicationHelper
    def heroicon(name, variant: Heroicon.configuration.variant, options: {}, path_attributes: {})
      raw Heroicon::Icon.render(
        name: name,
        variant: variant,
        options: options,
        path_attributes: path_attributes
      )
    end
  end
end
