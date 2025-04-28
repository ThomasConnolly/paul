# frozen_string_literal: true

# Skip credentials check during asset precompilation
if ENV['RAILS_PRECOMPILE_ASSETS'] == 'true' || (defined?(Rake) && Rake.const_defined?(:Application) &&
  Rake.application&.top_level_tasks&.include?('assets:precompile'))

  # Create a temporary mock for Rails.application.credentials using a Hash instead of OpenStruct
  module Rails
    class << self
      def application
        @application ||= Object.new.tap do |app|
          # Create a hash for credentials
          credentials_hash = {
            content: {},
            secret_key_base: ENV['SECRET_KEY_BASE'] || SecureRandom.hex(64)
          }

          # Define method to access credentials
          app.define_singleton_method(:credentials) do
            @credentials ||= Object.new.tap do |creds|
              # Define methods to access credentials content
              creds.define_singleton_method(:content) { credentials_hash[:content] }
              creds.define_singleton_method(:secret_key_base) { credentials_hash[:secret_key_base] }
            end
          end
        end
      end
    end
  end
end
