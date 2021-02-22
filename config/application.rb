require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VcaNews
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Brasilia"
    config.i18n.default_locale = :"pt-BR"

    config.cache_store = :mem_cache_store
    config.active_job.queue_adapter = :sidekiq
    
    moesif_options = {
      'application_id' => 'eyJhcHAiOiIxOTg6MTAxOCIsInZlciI6IjIuMCIsIm9yZyI6Ijg4OjE1NDEiLCJpYXQiOjE2MTIxMzc2MDB9.qNvR8FsdtPH6OiG93JkpwglyhfHyMoVnl6pTlYLT-xk'
    }
    config.middleware.use MoesifRack::MoesifMiddleware, moesif_options

    config.middleware.insert_before 0, Rack::Cors do
      allow do
         origins '*'
         resource '*', headers: :any, methods: [:get]
      end
    end
  end
end
