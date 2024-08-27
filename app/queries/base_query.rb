# frozen_string_literal: true

class BaseQuery
  include ActiveData::Model

  attr_accessor :input

  def initialize(**input)
    super(input)
    @input = input
  end

  class << self
    def search(**input)
      query = new(**input)
      query.validate!
      query.search
    end
  end
end
