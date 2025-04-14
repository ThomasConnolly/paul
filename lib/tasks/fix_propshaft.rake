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
  end
end

# Make this task run before assets:precompile
Rake::Task['assets:precompile'].enhance ['propshaft:fix_root']
