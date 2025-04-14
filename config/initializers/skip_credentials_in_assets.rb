# frozen_string_literal: true

# Skip credentials check during asset precompilation
if ENV['RAILS_ENV'] == 'production' &&
   defined?(Rake) &&
   Rake.application.top_level_tasks.include?('assets:precompile')

  # Create a temporary mock for Rails.application.credentials
  module Rails
    class << self
      def application
        @application ||= OpenStruct.new(
          credentials: OpenStruct.new(
            content: {},
            secret_key_base: ENV['SECRET_KEY_BASE'] || SecureRandom.hex(64)
          )
        )
      end
    end
  end
end
