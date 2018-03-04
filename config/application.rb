require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Gamarch
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil
    config.autoload_paths += Dir[Rails.root.join('lib')]

    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.available_locales = [:en, 'pt-BR']
    config.i18n.default_locale = :en

    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address: "smtp.mailgun.org",
      port: 587,
      domain: ENV['MAILGUN_DOMAIN'], # CHANGE THIS
      authentication: "plain",
      enable_starttls_auto: true,
      user_name: ENV['MAILGUN_SMTP_USERNAME'], # CHANGE THIS
      password: ENV['MAILGUN_SMTP_PASSWORD'] # CHANGE THIS
    }
  end
end
