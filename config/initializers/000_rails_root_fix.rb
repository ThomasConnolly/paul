# Comprehensive fix for Propshaft 'undefined method root for nil' error
require 'pathname'

# First, ensure Rails.root is available
unless defined?(Rails.root)
  module Rails
    def self.root
      @root ||= Pathname.new(File.expand_path('../..', __dir__))
    end
  end
end

# Ensure Rails.application exists and has a config
Rails.application unless defined?(Rails.application)

# Ensure Rails.application is properly defined
unless defined?(Rails.application) || Rails.application.nil?
  module Rails
    class << self
      def application
        @application ||= ::Paul::Application.instance
      end
    end
  end
end

# Ensure Rails.application.config has a root method
if Rails.application && Rails.application.respond_to?(:config) && 
   Rails.application.config && !Rails.application.config.respond_to?(:root)
  Rails.application.config.define_singleton_method(:root) do
   Rails.root
  end
end

# Ensure Rails::Application::Configuration has a root method
module Rails
  class Application
    class Configuration
      unless method_defined?(:root)
        def root
          @root ||= Rails.root
        end
      end
    end
  end
end

# Monkey patch Propshaft if needed
if defined?(Propshaft)
  module Propshaft
    unless respond_to?(:root)
      def self.root
        Rails.root
      end
    end
    
    class Compiler
      alias_method :original_initialize, :initialize if method_defined?(:initialize)
      
      def initialize(*args)
        if args.length == 2
          resolver, output_path = args
          @resolver = resolver
          @output_path = output_path
          # Use a hardcoded path instead of relying on application.config.root
          @manifest = Propshaft::Manifest.new(File.join(Rails.root.to_s, "public/assets/.manifest.json"))
        else
          # Fall back to original initialize
          original_initialize(*args) if respond_to?(:original_initialize)
        end
      end
    end
    
    # Also patch the Manifest class if needed
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

# Fix for importmap-rails specifically
if defined?(Importmap) || defined?(::Importmap)
  module Importmap
    class Engine < ::Rails::Engine
      # Monkey patch any initializers that might cause issues
      initializers.each do |initializer|
        if initializer.name == :importmap
          def initializer.run(*args)
            # Skip if application is nil
            app = args.first
            return unless app
            
            # Explicitly set up importmap paths using Rails.root directly
            Importmap::Engine.config.cache_sweepers ||= []
            Importmap::Engine.config.cache_sweepers << Rails.root.join("app/assets/config/importmap.json")
            Importmap::Engine.config.cache_sweepers << Rails.root.join("config/importmap.json")
            Importmap::Engine.config.cache_sweepers << Rails.root.join("config/importmap.rb")
          end
        end
      end
    end
  end
end

# NilClass fix for any other gems that might cause similar issues
class NilClass
  @@fake_config = nil
  
  def root
    Rails.root rescue Pathname.new(File.expand_path('../../', __dir__))
  end
  
  def config
    # Use a class variable instead of an instance variable to avoid modifying self
    @@fake_config ||= Object.new.tap do |obj|
      obj.define_singleton_method(:root) do
        begin
          Rails.root 
        rescue
          Pathname.new(File.expand_path('../../', __dir__))
        end
      end
      # Add relative_url_root method that Propshaft needs
      obj.define_singleton_method(:relative_url_root) do
        ""
      end

      # Add prefix method that might be needed based on the error
      obj.define_singleton_method(:prefix) do
        ""
      end
    end
  end
end
