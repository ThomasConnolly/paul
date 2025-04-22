# frozen_string_literal: true

# Safe monkey patching for Propshaft - without modifying source files
if defined?(Propshaft)
  # Add a safer load_path method to Compiler
  Propshaft::Compiler.class_eval do
    # Create a safe wrapper around the original method
    alias_method :original_load_path, :load_path if method_defined?(:load_path)

    def load_path(logical_path)
      return '' unless @resolver

      begin
        original_load_path(logical_path)
      rescue StandardError => e
        Rails.logger.warn("Propshaft load_path error: #{e.message}")
        Rails.root.join('app/assets', logical_path.to_s).to_s
      end
    end
  end
end

# Use a safe approach with Rails initializers
Rails.configuration.to_prepare do
  # Replace the problematic method only if necessary
  if defined?(Propshaft::Compiler::SourceMappingUrls) && Propshaft::Compiler::SourceMappingUrls.instance_methods.exclude?(:safe_source_mapping_url_added)
    Propshaft::Compiler::SourceMappingUrls.class_eval do
      # Mark that we've patched this class
      def safe_source_mapping_url_added = true

      # Safely override the original method
      alias_method :original_source_mapping_url, :source_mapping_url if method_defined?(:source_mapping_url)

      def source_mapping_url(logical_path)
        return '' unless compiler

        begin
          path = compiler.load_path(logical_path)
          return '' unless path.present? && File.exist?(path)

          map_path = "#{path}.map"
          if File.exist?(map_path)
            File.join(compiler.url_prefix, "#{logical_path}.map")
          else
            ''
          end
        rescue StandardError => e
          Rails.logger.warn("Propshaft source_mapping_url error: #{e.message}")
          ''
        end
      end

      # Safely override compile
      alias_method :original_compile, :compile if method_defined?(:compile)

      def compile(logical_path, input)
        return input unless input.is_a?(String)

        begin
          input.gsub(%r{//# sourceMappingURL=.+\n}m) do
            url = source_mapping_url(logical_path)
            url.empty? ? '' : "//# sourceMappingURL=#{url}\n"
          end
        rescue StandardError => e
          Rails.logger.warn("Propshaft compile error: #{e.message}")
          input
        end
      end
    end
  end
end
