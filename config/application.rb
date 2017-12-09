require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WTrabel
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.time_zone = 'Lima'
    config.i18n.default_locale = :en
    config.encoding = 'utf-8'

    config.filter_parameters << :password

    #sentry
    Raven.configure do |config|
      config.dsn = 'https://940617ef1b8241a6b31c3c1f4880f3b5:01166c10750c49aeaefd0d04ba3080ba@sentry.io/257047'
    end
  end
end
