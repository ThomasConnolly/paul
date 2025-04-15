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
    end
  end
end

# IMPORTANT: This must be inside a condition that only runs when the Rake tasks are loaded
if defined?(Rake) && Rake::Task.task_defined?('assets:precompile')
  Rake::Task['assets:precompile'].enhance ['propshaft:fix_root']
end