# Only apply fixes during asset precompilation on Heroku
if defined?(Rake) && 
  Rake.respond_to?(:application) && 
  Rake.application.top_level_tasks.include?('assets:precompile')
 
  # Add fallback for secret_key_base if missing
  if Rails.env.production? && ENV['SECRET_KEY_BASE'].nil?
    require 'securerandom'
    ENV['SECRET_KEY_BASE'] = SecureRandom.hex(64)
  end
  
  # Define our custom key generator
  class CustomKeyGenerator
    def initialize(secret)
      @secret = secret
    end
    
    def generate_key(salt, key_size=64)
      require 'openssl'
      OpenSSL::PKCS5.pbkdf2_hmac_sha1(@secret, salt, 1000, key_size)
    end
  end
  
  # Create a global key generator for use throughout the initializer
  $key_generator = CustomKeyGenerator.new(ENV['SECRET_KEY_BASE'] || SecureRandom.hex(64))
  
  # Monkey patch Turbo::Engine to bypass the key_generator call entirely
  if defined?(Turbo) && defined?(Turbo::Engine)
    module Turbo
      class Engine < ::Rails::Engine
        # Override the initializer that uses key_generator
        initializers.find { |i| i.name == "turbo.signed_stream_verifier_key" }&.instance_variable_set(:@block, proc {
          config.signed_stream_verifier_key = SecureRandom.hex(32)
        })
      end
    end
  end
  
  # Intercept ALL calls to Rails.application.key_generator.generate_key
  module Rails
    def self.application
      app = super rescue nil
      
      # Return a proxy object if the real application is nil
      if app.nil?
        proxy = Object.new
        
        # Define method_missing to handle any method call
        def proxy.method_missing(method, *args)
          if method == :key_generator
            # Return a key_generator proxy
            kg_proxy = Object.new
            
            # Handle generate_key specifically
            def kg_proxy.generate_key(salt, key_size=64)
              $key_generator.generate_key(salt, key_size)
            end
            
            # Handle any other method on key_generator
            def kg_proxy.method_missing(method, *args)
              nil
            end
            
            kg_proxy
          else
            nil
          end
        end
        
        return proxy
      end
      
      # For a real application, ensure it has a key_generator
      unless app.respond_to?(:key_generator) && app.key_generator
        app.singleton_class.class_eval do
          define_method(:key_generator) do
            @custom_key_generator ||= $key_generator
          end
        end
      end
      
      app
    end
  end
  
  # Also hook public_path and root
  module Rails
    class << self
      # Hook before our own method_missing
      alias_method :original_public_path, :public_path if method_defined?(:public_path)
      
      # Override the public_path method directly
      def public_path
        if respond_to?(:original_public_path)
          original_public_path
        else
          root.join('public')
        end
      end
      
      # Override Rails.root
      alias_method :original_root, :root if method_defined?(:root)
      
      def root
        if respond_to?(:original_root)
          original_root
        else
          @_custom_root ||= Pathname.new(File.expand_path('../..', __FILE__))
        end
      end
      
      # Override Rails.autoloaders
      alias_method :original_autoloaders, :autoloaders if method_defined?(:autoloaders)
      
      def autoloaders
        if respond_to?(:original_autoloaders)
          original_autoloaders
        else
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
      end
    end
  end
  
  # Last resort: Monkey patch the specific method call that's failing
  old_method = Kernel.instance_method(:method_missing)
  
  Kernel.define_method(:method_missing) do |method, *args, &block|
    # Check for the specific pattern that's failing
    if self.is_a?(Object) && method == :key_generator && caller_locations(1, 1)[0].label.include?('generate_key')
      $key_generator
    else
      old_method.bind(self).call(method, *args, &block)
    end
  end
end