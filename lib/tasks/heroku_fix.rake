# frozen_string_literal: true

namespace :heroku do
  task precompile: :environment do
    # Define a task that Heroku can run before asset precompilation
    puts 'Applying Heroku fixes before asset precompilation...'
  end
end

# Ensure our fix task runs before assets:precompile
Rake::Task['assets:precompile'].enhance ['heroku:precompile']
