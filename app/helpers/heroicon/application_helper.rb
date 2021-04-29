# frozen_string_literal: true

module Heroicon
  module ApplicationHelper
    def heroicon(name, variant: Heroicon.configuration.variant, options: {}, path_options: {})
      raw Heroicon::Icon.render(
        name: name,
        variant: variant,
        options: options,
        path_options: path_options
      )
    end
  end
end
