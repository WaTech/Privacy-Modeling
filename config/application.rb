require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Watech
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators do |g|
      g.template_engine :slim
    end

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address:              ENV['ACTION_MAILER_ADDRESS'],
      port:                 587,
      domain:               ENV['ACTION_MAILER_DOMAIN'],
      user_name:            ENV['ACTION_MAILER_USER_NAME'],
      password:             ENV['ACTION_MAILER_PASSWORD'],
      authentication:       ENV['ACTION_MAILER_AUTHENTICATION'],
      enable_starttls_auto: true }

    config.action_mailer.default_url_options = { host: ENV['ACTION_MAILER_URL_HOST'], port: ENV['ACTION_MAILER_URL_PORT'] }
  end
end
