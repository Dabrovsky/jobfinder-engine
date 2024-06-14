# frozen_string_literal: true

module CommandHandler
  extend ActiveSupport::Concern

  COMMAND_NOT_PROVIDED = "Command not provided"

  class_methods do
    def invoke_command(input: nil, command: nil)
      call_command(command, input)
    end

    private

    def call_command(command, input)
      raise ArgumentError, COMMAND_NOT_PROVIDED unless command

      command.new(**input).call
    end
  end
end
