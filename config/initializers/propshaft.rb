# frozen_string_literal: true

# filepath: /home/tom/paul/config/initializers/propshaft.rb
Rails.application.config.assets.paths << Rails.root.join('app/assets/stylesheets')
Rails.application.config.assets.paths << Rails.root.join('app/javascript')
