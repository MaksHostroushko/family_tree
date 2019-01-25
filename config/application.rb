require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module FamilyTree
  class Application < Rails::Application
    config.load_defaults 5.2

    config.time_zone = 'Kyiv'
    config.i18n.available_locales = [:uk, :en]
    config.i18n.default_locale = :uk

  end
end
