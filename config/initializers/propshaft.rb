# frozen_string_literal: true

Rails.application.config.assets.compile = true

# Alternative fix for Propshaft on Heroku
if defined?(Propshaft)
  module Rails
    class Application
      class Configuration
        def root
          @root ||= Rails.root
        end
      end
    end
  end
end
