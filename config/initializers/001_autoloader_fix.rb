# Only apply the root fix during asset precompilation on Heroku
if defined?(Rake) && 
    Rake.respond_to?(:application) && 
    Rake.application.top_level_tasks.include?('assets:precompile')
   
   module Rails
     class << self
       # Store original methods
       alias_method :original_root, :root if method_defined?(:root)
       alias_method :original_application, :application if method_defined?(:application)
       
       # Override Rails.root
       def root
         @_custom_root ||= begin
           Pathname.new(File.expand_path('../..', __FILE__))
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
             
             # Add paths configuration
             app.paths = {
               "public" => [File.join(root, "public")],
               "log" => [File.join(root, "log")],
               "tmp" => [File.join(root, "tmp")]
             }
             
             # Make paths act like a HashWithIndifferentAccess
             def app.paths.[](key)
               self.fetch(key) || self.fetch(key.to_s)
             end
           end
           
           app
         end
       end
     end
   end
 end