# frozen_string_literal: true

module Heroicon
  class Engine < ::Rails::Engine
    isolate_namespace Heroicon

    initializer "heroicon.precompile_assets" do |app|
      app.config.assets.precompile << "heroicon_manifest.js"
    end
  end
end
