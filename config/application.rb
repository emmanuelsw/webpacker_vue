require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module WebpackerVue
  class Application < Rails::Application
    config.load_defaults 5.2

    config.generators.system_tests = nil
    config.generators do |g|
      g.test_framework  false
      g.stylesheets     false
      g.javascripts     false
      g.helper          false
      g.channel         assets: false
    end
  end
end
