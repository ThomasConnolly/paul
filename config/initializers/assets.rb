# typed: false
# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.7'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add additional assets to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules/bootstrap/dist/css')
Rails.application.config.assets.paths << Rails.root.join('node_modules/trix/dist')
Rails.application.config.assets.paths << Rails.root.join('app/assets/builds')

# Precompile additional assets.
Rails.application.config.assets.precompile += %w[bootstrap.min.css trix.css
                                                 custom.css custom2.css actiontext.css]
