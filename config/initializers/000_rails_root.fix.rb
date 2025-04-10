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
    # Save original application method
    class << self
      alias_method :original_application, :application if method_defined?(:application)
    end
    
    def self.application
      app = original_application rescue nil
      
      # Return a proxy object if the real application is nil
      if app.nil?
        proxy = Object.new
        
        # Create a config object with required properties
        config = Object.new
        
        # Add active_storage property to config
        def config.active_storage
          @active_storage ||= begin
            storage = Object.new
            
            def storage.method_missing(*)
              nil
            end
            
            storage
          end
        end
        
        # Add other commonly accessed config properties
        %w[cache_classes eager_load debug consider_all_requests_local secret_key_base
           log_level filter_parameters active_record assets action_controller].each do |prop|
          config.define_singleton_method(prop) { nil }
        end
        
        # Add config property to proxy
        proxy.define_singleton_method(:config) { config }
        
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
      
      # Ensure app.config.active_storage exists
      if app.respond_to?(:config) && app.config && !app.config.respond_to?(:active_storage)
        storage = Object.new
        
        def storage.method_missing(*)
          nil
        end
        
        app.config.define_singleton_method(:active_storage) { storage }
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
  
  # Alternative approach: Patch Object directly
  class Object
    # Store the original method_missing if it exists
    if method_defined?(:method_missing)
      alias_method :original_method_missing, :method_missing
    end
    
    # Define our own method_missing that catches key_generator calls
    def method_missing(method, *args, &block)
      # Check for the specific pattern that's failing
      if method == :key_generator && caller_locations(1, 1)[0].label.include?('generate_key')
        return $key_generator
      elsif method == :active_storage
        storage = Object.new
        def storage.method_missing(*)
          nil
        end
        return storage
      end
      
      # Call the original method_missing if it exists
      if respond_to?(:original_method_missing)
        original_method_missing(method, *args, &block)
      else
        super
      end
    end
  end
end
 
