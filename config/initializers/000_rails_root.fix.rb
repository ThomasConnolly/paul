# Only apply fixes during asset precompilation on Heroku
if defined?(Rake) && 
  Rake.respond_to?(:application) && 
  Rake.application.top_level_tasks.include?('assets:precompile')
 
 module Rails
   class << self
     # Store original methods
     alias_method :original_root, :root if method_defined?(:root)
     alias_method :original_application, :application if method_defined?(:application)
     alias_method :original_autoloaders, :autoloaders if method_defined?(:autoloaders)
     
     # Override Rails.root
     def root
       @_custom_root ||= begin
         Pathname.new(File.expand_path('../..', __FILE__))
       end
     end
     
     # Override Rails.autoloaders
     def autoloaders
       @_autoloaders ||= begin
         require 'zeitwerk'
         loader = Zeitwerk::Loader.new
         
         obj = Object.new
         def obj.main
           @loader ||= Zeitwerk::Loader.new
         end
         
         obj
       end
     end
     
     # Override Rails.application
     def application
       @_custom_application ||= begin
         app = if respond_to?(:original_application)
           original_application 
         else 
           nil
         end
         
         if app.nil? || app.config.nil?
           require 'ostruct'
           app = OpenStruct.new
           app.config = OpenStruct.new
           app.config.root = root
           
           # Create a custom class for paths
           path_class = Class.new do
             def initialize(root)
               @root = root
               @paths = {
                 "public" => [File.join(@root, "public")],
                 "log" => [File.join(@root, "log")],
                 "tmp" => [File.join(@root, "tmp")]
               }
             end
             
             def [](key)
               @paths[key.to_s]
             end
           end
           
           # Assign the paths object
           app.paths = path_class.new(root)
         end
         
         app
       end
     end
   end
 end
end