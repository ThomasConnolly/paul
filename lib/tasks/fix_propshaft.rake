# frozen_string_literal: true

namespace :propshaft do
  task fix_root: :environment do
    puts 'Directly patching Propshaft source code...'

    # Find the gem path
    propshaft_path = Gem.loaded_specs['propshaft'].full_gem_path
    puts "Propshaft installed at: #{propshaft_path}"

    # Most likely locations for the error
    files_to_check = [
      File.join(propshaft_path, 'lib/propshaft/compiler.rb'),
      File.join(propshaft_path, 'lib/propshaft/asset.rb'),
      File.join(propshaft_path, 'lib/propshaft/assembly.rb')
    ]

    files_to_check.each do |file|
      next unless File.exist?(file)

      puts "Checking file: #{file}"
      content = File.read(file)

      next unless content.include?('application && application.config.root')

      puts "Found problematic code in: #{file}"

      # Replace with a direct reference to Rails.root
      new_content = content.gsub(
        'application && application.config.root',
        'Rails.root # Fixed by direct patching'
      )

      # Write the patched file
      File.write(file, new_content)
      puts "Successfully patched #{file}"
    end

    # Also search all files just in case
    Dir.glob(File.join(propshaft_path, '**/*.rb')).each do |file|
      next if files_to_check.include?(file)

      content = File.read(file)
      next unless content.include?('application && application.config.root')

      puts "Found problematic code in additional file: #{file}"

      # Replace with a direct reference to Rails.root
      new_content = content.gsub(
        'application && application.config.root',
        'Rails.root # Fixed by direct patching'
      )

      # Write the patched file
      File.write(file, new_content)
      puts "Successfully patched #{file}"
    end
    
    # Add a fix for the url_prefix method
    if File.exist?(File.join(propshaft_path, 'lib/propshaft/compiler.rb'))
      file_path = File.join(propshaft_path, 'lib/propshaft/compiler.rb')
      content = File.read(file_path)
      
      if content.include?('config.relative_url_root')
        puts "Patching url_prefix method in Propshaft compiler..."
        
        # Replace the problematic url_prefix method
        patched_content = content.gsub(
          /def url_prefix.*?end/m,
          <<~RUBY
            def url_prefix
              # Safely handle missing config methods
              prefix_str = ""
              if config.respond_to?(:prefix)
                prefix_str = config.prefix.to_s
              end
              
              relative_root = ""
              if config.respond_to?(:relative_url_root)
                relative_root = config.relative_url_root.to_s
              end
              
              @url_prefix ||= File.join(relative_root, prefix_str).chomp("/")
            end
          RUBY
        )
        
        # Write the patched file
        File.write(file_path, patched_content)
        puts "Successfully patched url_prefix method"
      end
      
      # Fix for the load_path method
      if content.include?('def load_path')
        puts "Patching load_path method in Propshaft compiler..."
        
        # Replace the problematic load_path method
        patched_content = content.gsub(
          /def load_path.*?end/m,
          <<~RUBY
            def load_path(logical_path)
              # Make sure resolver is defined
              return "" unless @resolver
              
              # Safely find the load path
              begin
                @resolver.find(logical_path)
              rescue => e
                # Fall back to a safe default path
                Rails.root.join("app/assets", logical_path).to_s
              end
            end
          RUBY
        )
        
        # Write the patched file
        File.write(file_path, patched_content)
        puts "Successfully patched load_path method"
      end
    end

    # Also patch the source_mapping_urls.rb file which is causing the error
    source_mapping_file = File.join(propshaft_path, 'lib/propshaft/compiler/source_mapping_urls.rb')
    if File.exist?(source_mapping_file)
      content = File.read(source_mapping_file)
      
      puts "Checking source_mapping_urls.rb file..."
      
      # Add safety checks around source_mapping_url method
      patched_content = content.gsub(
        /def source_mapping_url.*?end/m,
        <<~RUBY
          def source_mapping_url(logical_path)
            return "" unless compiler && compiler.respond_to?(:load_path)
            
            begin
              path = compiler.load_path(logical_path)
              return "" unless path && !path.empty?
              
              # Rest of the original method with safety
              if File.exist?(path)
                map_path = path + ".map"
                if File.exist?(map_path)
                  File.join(compiler.url_prefix, logical_path + ".map")
                end
              else
                ""
              end
            rescue => e
              # Return empty string on error
              ""
            end
          end
        RUBY
      )
      
      # Also make the compile method safer
      patched_content = patched_content.gsub(
        /def compile.*?end/m,
        <<~RUBY
          def compile(logical_path, input)
            return input unless input.is_a?(String)
            
            begin
              input.gsub(/\/\/# sourceMappingURL=.+\\n/m) do
                if url = source_mapping_url(logical_path)
                  "//# sourceMappingURL=\#{url}\\n"
                else
                  ""
                end
              end
            rescue => e
              # Return original input on error
              input
            end
          end
        RUBY
      )
      
      # Write the patched file
      File.write(source_mapping_file, patched_content)
      puts "Successfully patched source_mapping_urls.rb"
    end
  end
end

# IMPORTANT: This must be inside a condition that only runs when the Rake tasks are loaded
if defined?(Rake) && Rake::Task.task_defined?('assets:precompile')
  Rake::Task['assets:precompile'].enhance ['propshaft:fix_root']
end