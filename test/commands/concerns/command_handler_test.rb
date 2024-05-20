# frozen_string_literal: true

require "test_helper"

class CommandHandlerTest < ActiveSupport::TestCase
  class TestHandler
    include CommandHandler
  end

  class Test < Command
    def call
      input
    end
  end

  attr_reader :input

  setup do
    @input = {}
  end

  test ".invoke_command raises ArgumentError if command not provided" do
    exception = assert_raises ArgumentError do
      TestHandler.invoke_command(input:)
    end

    assert_equal CommandHandler::COMMAND_NOT_PROVIDED, exception.message
  end

  test ".invoke_command calls the specified command with the provided input" do
    output = TestHandler.invoke_command(input:, command: Test)

    assert_equal input, output
  end
end
