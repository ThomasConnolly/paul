# Ensure Rails.root is always available even during asset precompilation
module Rails
    class << self
      # Completely override the Rails.root method
      def root
        @_root ||= begin
          # Use the current directory as a fallback
          Pathname.new(File.expand_path('../../', __FILE__))
        end
      end
      
      # Store the original method
      alias_method :original_application, :application if method_defined?(:application)
      
      # Override the application method to ensure it's never nil
      def application
        @_application ||= begin
          app = if respond_to?(:original_application)
            original_application 
          else 
            nil
          end
          
          if app.nil?
            # Create a minimal application stub with config.root
            require 'ostruct'
            app = OpenStruct.new
            app.config = OpenStruct.new
            app.config.root = root
          end
          
          app
        end
      end
    end
  end