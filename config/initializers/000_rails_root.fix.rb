# Ensure Rails.root is always available
if !defined?(Rails.root) || Rails.root.nil?
    module Rails
      def self.root
        @_root ||= begin
          # Use the current directory as a fallback if we're in an initializer
          if defined?(ENGINE_ROOT)
            Pathname.new(ENGINE_ROOT)
          elsif defined?(APP_PATH)
            Pathname.new(APP_PATH).parent
          else
            Pathname.new(File.dirname(__FILE__)).parent.parent
          end
        end
      end
    end
  end