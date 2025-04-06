# frozen_string_literal: true

namespace :assets do
  task precompile: :environment do
    system('yarn run build')
    system('yarn run build:css')
  end
end
