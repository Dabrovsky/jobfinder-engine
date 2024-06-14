# frozen_string_literal: true

class Command
  attr_reader :input

  def initialize(**input)
    @input = input
  end

  def call
    raise NotImplementedError
  end
end
