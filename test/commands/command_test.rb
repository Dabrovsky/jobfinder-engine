# frozen_string_literal: true

require "test_helper"

class CommandTest < ActiveSupport::TestCase
  test ".call method is called" do
    input = {}

    assert_raises NotImplementedError do
      Command.new(**input).call
    end
  end
end
