# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules', 'govuk-frontend', 'govuk', 'assets', 'images')
Rails.application.config.assets.paths << Rails.root.join('node_modules', 'govuk-frontend', 'govuk', 'assets', 'fonts')
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile << 'application-ie8.css'
Rails.application.config.assets.precompile << 'govuk-frontend/govuk/assets/*'
Rails.application.config.assets.precompile << 'leaflet/dist/leaflet.css'
Rails.application.config.assets.precompile << 'leaflet/dist/images/*'
Rails.application.config.assets.precompile << 'html5shiv/dist/html5shiv.min.js'
