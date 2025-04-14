# Fix for Heroku Propshaft root issue - more aggressive approach

# Ensure Rails and Rails.application are always available
if !defined?(Rails)
  module Rails
    def self.application
      nil
    end
    
    def self.root
      Pathname.new(File.expand_path('../..', __dir__))
    end
  end
end

# First, ensure that Rails.application exists
if !defined?(Rails.application) || Rails.application.nil?
  module Rails
    def self.application
      @application ||= ::Paul::Application.new rescue nil
    end
  end
end

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

# Fix for undefined config variable
if defined?(Rails.application) && Rails.application
  # Make sure config exists
  Rails.application.instance_variable_set(:@config, Rails.application.config) unless Rails.application.instance_variable_get(:@config)
end

# Directly monkey patch Propshaft if it's loaded
if defined?(Propshaft)
  module Propshaft
    def self.root
      Rails.root
    end
    
    class Compiler
      # Use a method alias approach instead of redefining initialize
      alias_method :original_initialize, :initialize if method_defined?(:initialize)
      
      def initialize(*args)
        if args.length == 2
          # Standard initialize call with resolver and output_path
          resolver, output_path = args
          @resolver = resolver
          @output_path = output_path
          @manifest = Propshaft::Manifest.new(File.join(Rails.root.to_s, "public/assets/.manifest.json"))
        else
          # Fall back to original initialize if argument count doesn't match
          original_initialize(*args) if respond_to?(:original_initialize)
        end
      end
    end
    
    class Manifest
      # Override the path method only if it exists
      if method_defined?(:path)
        alias_method :original_path, :path
        
        def path
          @path || File.join(Rails.root.to_s, "public/assets/.manifest.json")
        end
      end
    end
  end
end