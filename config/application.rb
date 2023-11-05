require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    config.active_support.cache_format_version = 7.1

    Rails.application.config.action_dispatch.cookies_serializer = :json

    config.time_zone = 'Moscow'
    config.active_record.default_timezone = :local

    config.i18n.default_locale = :ru
    # config.eager_load_paths << Rails.root.join("extras")

    config.autoload_paths << "#{Rails.root}/lib/clients"
  end
end
