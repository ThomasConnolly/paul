# Only run during asset precompilation
if defined?(Rake) && 
    Rake.respond_to?(:application) && 
    Rake.application.top_level_tasks.include?('assets:precompile')
  
  # Create a stub for Rails.autoloaders.main that returns a minimal loader
  module Rails
    class << self
      # Store the original autoloaders method if it exists
      alias_method :original_autoloaders, :autoloaders if method_defined?(:autoloaders)
      
      # Override the autoloaders method
      def autoloaders
        # Try to use the original method first
        loaders = if respond_to?(:original_autoloaders)
          original_autoloaders
        else
          instance_variable_get(:@autoloaders)
        end
        
        # If we don't have autoloaders, create a minimal structure
        if loaders.nil?
          require 'zeitwerk'
          require 'ostruct'
          
          loaders = OpenStruct.new
          
          # Add a main method
          def loaders.main
            @main_loader ||= Zeitwerk::Loader.new
          end
          
          # Store it for future use
          @autoloaders = loaders
        end
        
        # Add main method if it doesn't exist
        if !loaders.respond_to?(:main)
          loader = Zeitwerk::Loader.new
          loaders.define_singleton_method(:main) do
            loader
          end
        end
        
        loaders
      end
    end
  end
end