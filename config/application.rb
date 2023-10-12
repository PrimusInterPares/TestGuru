require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.active_support.cache_format_version = 7.0

    Rails.application.config.action_dispatch.cookies_serializer = :json

    config.time_zone = 'Moscow'
    config.active_record.default_timezone = :local

    config.i18n.default_locale = :en
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
