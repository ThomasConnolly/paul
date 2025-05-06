if Rails.env.production?
    # Add routes that bypass most Rails code for debugging
    Rails.application.config.after_initialize do
      Rails.application.routes.draw do
        # A raw Rack endpoint that doesn't use ApplicationController
        get '/debug' => proc { |env| [200, {'Content-Type' => 'text/plain'}, ['App initialized successfully']] }
        
        # Emergency override of root route
        root to: proc { |env| [200, {'Content-Type' => 'text/html'}, ['<html><body><h1>App is running</h1><p>Root page temporarily overridden for troubleshooting.</p></body></html>']] }
      end
    end
    
    # Force errors to stdout
    Rails.logger.level = Logger::DEBUG
    ActionDispatch::DebugExceptions.prepend(Module.new do
      def render_exception(env, exception)
        puts "ERROR: #{exception.class} - #{exception.message}"
        puts exception.backtrace.join("\n")
        super
      end
    end)
  end