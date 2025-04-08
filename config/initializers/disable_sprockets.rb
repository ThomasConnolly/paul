# Explicitly disable Sprockets even if it's present as a dependency
if defined?(Sprockets)
    module Sprockets
      class Railtie
        # Override initializers to prevent Sprockets from loading
        def self.initializers
          []
        end
      end
    end
  end
  
  # Double-ensure Propshaft is the active asset pipeline
  Rails.application.config.after_initialize do
    Rails.application.config.asset_pipeline = :propshaft
  end