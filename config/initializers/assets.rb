# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w[profile_card.css]
Rails.application.config.assets.precompile += %w[nav_bar.css]
Rails.application.config.assets.precompile += %w[sticky_footer.css right_sidebar.css right_sidebar.js]
Rails.application.config.assets.precompile += %w[user_system.css grid_display.css community/hover_button_transition.js community/membership_approval_toggle.js]

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
