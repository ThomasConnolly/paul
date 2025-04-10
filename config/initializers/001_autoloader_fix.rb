# Only run during asset precompilation
if defined?(Rake) && 
    Rake.respond_to?(:application) && 
    Rake.application.top_level_tasks.include?('assets:precompile')
  
  # Create a minimal autoloaders structure if it doesn't exist
  Rails.application.config.before_initialize do
    # If autoloaders isn't defined or is nil, create a basic structure
    if !defined?(Rails.autoloaders) || Rails.autoloaders.nil?
      require 'zeitwerk'
      require 'ostruct'
      
      # Create a minimal autoloaders object with a main method
      autoloaders = OpenStruct.new
      loader = Zeitwerk::Loader.new
      
      # Add a main method that returns the loader
      def autoloaders.main
        @main_loader
      end
      
      # Store the loader
      autoloaders.instance_variable_set(:@main_loader, loader)
      
      # Assign to Rails
      Rails.instance_variable_set(:@autoloaders, autoloaders)
    elsif !Rails.autoloaders.respond_to?(:main)
      # If autoloaders exists but has no main method, add one
      main_loader = Zeitwerk::Loader.new
      
      # Add the main method
      Rails.autoloaders.define_singleton_method(:main) do
        main_loader
      end
    end
  end
end