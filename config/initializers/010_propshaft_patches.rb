# Direct monkey patching for Propshaft
if defined?(Propshaft)
    module Propshaft
      class Compiler
        # Ensure load_path always returns something and never errors
        alias_method :original_load_path, :load_path if method_defined?(:load_path)
        
        def load_path(logical_path)
          return "" if @resolver.nil?
          
          begin
            @resolver.find(logical_path)
          rescue => e
            # Fall back to a safe default path
            Rails.root.join("app/assets", logical_path).to_s
          end
        end
        
        # Nested module for source mapping URLs - properly access it
        if defined?(SourceMappingUrls)
          module SourceMappingUrls
            # Override source_mapping_url to be safe
            alias_method :original_source_mapping_url, :source_mapping_url if method_defined?(:source_mapping_url)
            
            def source_mapping_url(logical_path)
              return "" unless compiler
              
              begin
                path = compiler.load_path(logical_path)
                return "" unless path && !path.empty?
                
                if File.exist?(path)
                  map_path = path + ".map"
                  if File.exist?(map_path)
                    File.join(compiler.url_prefix, logical_path + ".map")
                  end
                end
              rescue => e
                # Return empty string on error
                ""
              end
            end
            
            # Override compile to be safe
            alias_method :original_compile, :compile if method_defined?(:compile)
            
            def compile(logical_path, input)
              return input unless input.is_a?(String)
              
              begin
                input.gsub(/\/\/# sourceMappingURL=.+\n/m) do
                  if url = source_mapping_url(logical_path)
                    "//# sourceMappingURL=#{url}\n"
                  else
                    ""
                  end
                end
              rescue => e
                # Return original input on error
                input
              end
            end
          end
        end
      end
    end
  end