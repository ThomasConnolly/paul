# Fix for Heroku Propshaft root issue - more aggressive approach

# First, ensure that Rails.application exists
Rails.application unless defined?(Rails.application)

# Monkey patch the Rails::Application class
module Rails
  class Application
    class << self
      def instance
        @instance ||= new
      end
    end
    
    class Configuration
      # Ensure root method exists
      def root
        @root ||= Rails.root
      end
    end
  end
end

# Ensure Rails.application.config exists and has a root method
if Rails.application && !Rails.application.config.respond_to?(:root)
  Rails.application.config.define_singleton_method(:root) do
    Rails.root
  end
end

# Directly monkey patch Propshaft if it's loaded
if defined?(Propshaft)
  module Propshaft
    class Compiler
      # Override the constructor to use Rails.root directly
      def initialize(resolver, output_path)
        @resolver = resolver
        @output_path = output_path
        @manifest = Propshaft::Manifest.new(File.join(Rails.root, "public/assets/.manifest.json"))
      end
    end
    
    class Manifest
      # Override the path method
      def path
        @path || File.join(Rails.root, "public/assets/.manifest.json")
      end
    end
  end
end