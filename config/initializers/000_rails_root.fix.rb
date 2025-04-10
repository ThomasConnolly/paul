# Only apply fixes during asset precompilation on Heroku
if defined?(Rake) && 
  Rake.respond_to?(:application) && 
  Rake.application.top_level_tasks.include?('assets:precompile')
 
  module Rails
    class << self
      # Override the public_path method directly
      def public_path
        @_public_path ||= root.join('public')
      end
      
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
            
            # Create paths directly as a hash with string access
            paths = {}
            
            # Add standard paths
            paths["public"] = [root.join("public").to_s]
            paths["log"] = [root.join("log").to_s]
            paths["tmp"] = [root.join("tmp").to_s]
            
            # Define method_missing to handle dynamic path lookups
            def paths.method_missing(name, *args)
              key = name.to_s
              return self[key] if self.has_key?(key)
              super
            end
            
            # Define [] method for hash-like access
            def paths.[](key)
              # Convert to string for consistent access
              str_key = key.to_s
              return self.fetch(str_key, nil)
            end
            
            # Assign to app
            app.paths = paths
          end
          
          app
        end
      end
    end
  end
  
  # Also override the Rails.public_path method at the module level
  # This ensures it's available even if the class method doesn't get called
  def Rails.public_path
    root.join('public')
  end
end