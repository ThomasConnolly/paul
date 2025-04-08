# Ensure Rails.root is always available
# Ensure Rails.root and Rails.application.config.root are always available
if !defined?(Rails.root) || Rails.root.nil? || !defined?(Rails.application) || Rails.application.nil?
    module Rails
      class << self
        # Define a custom application method
        def application
          @_application ||= begin
            # Create a minimal application stub with config.root
            require 'ostruct'
            app = OpenStruct.new
            app.config = OpenStruct.new
            app.config.root = root
            app
          end
        end
        
        # Define root method
        def root
          @_root ||= begin
            # Use the current directory as a fallback if we're in an initializer
            if defined?(ENGINE_ROOT)
              Pathname.new(ENGINE_ROOT)
            elsif defined?(APP_PATH)
              Pathname.new(APP_PATH).parent
            else
              Pathname.new(File.dirname(__FILE__)).parent.parent
            end
          end
        end
      end
    end
  end