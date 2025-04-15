# frozen_string_literal: true

namespace :propshaft do
  task fix_root: :environment do
    puts 'Applying Heroku fixes before asset precompilation...'
    # No longer directly patching files as it can cause syntax errors
  end
end

# Make this task run before assets:precompile
Rake::Task['assets:precompile'].enhance ['propshaft:fix_root'] if defined?(Rake) && Rake::Task.task_defined?('assets:precompile')