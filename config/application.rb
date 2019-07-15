require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module FamilyTree
  class Application < Rails::Application
    config.load_defaults 5.2

    config.time_zone = 'Kyiv'
    config.i18n.available_locales = [:ua, :en]
    config.i18n.default_locale = :ua

    # Додавання токена підтвердження автентичності в віддаленій формі
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
