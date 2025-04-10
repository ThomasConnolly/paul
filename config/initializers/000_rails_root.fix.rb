# Only apply fixes during asset precompilation on Heroku
if defined?(Rake) && 
  Rake.respond_to?(:application) && 
  Rake.application.top_level_tasks.include?('assets:precompile')
 
  # Add fallback for secret_key_base if missing
  if Rails.env.production? && ENV['SECRET_KEY_BASE'].nil?
    require 'securerandom'
    ENV['SECRET_KEY_BASE'] = SecureRandom.hex(64)
  end
  
  # Define the key generator class
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
  
  # Monkey patch Turbo::Engine to bypass the key_generator call
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
  
  # Direct patch for Rails.application.key_generator
  module Rails
    class Application
      # Add key_generator method if it's missing
      unless method_defined?(:key_generator)
        define_method(:key_generator) { $key_generator }
      end
    end
  end
  
  # Override methods in Rails module
  module Rails
    class << self
      # Override the public_path method directly
      def public_path
        @_public_path ||= root.join('public')
      end
      
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
    end
  end
end