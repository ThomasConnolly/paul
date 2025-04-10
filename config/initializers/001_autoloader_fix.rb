# Only run during asset precompilation
if defined?(Rake) && 
    Rake.respond_to?(:application) && 
    Rake.application.top_level_tasks.include?('assets:precompile')
   
   # Ensure autoloaders are set up
   Rails.application.config.before_initialize do
     # Set up autoloaders if they're not initialized
     if Rails.autoloaders.respond_to?(:zeitwerk_enabled?) && Rails.autoloaders.zeitwerk_enabled?
       Rails.autoloaders.instance_variable_get(:@main) ||= Zeitwerk::Loader.new
     end
   end
 end