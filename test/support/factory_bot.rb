# frozen_string_literal: true

require "factory_bot_rails"

module ActiveSupport
  class TestCase
    include FactoryBot::Syntax::Methods
  end
end
