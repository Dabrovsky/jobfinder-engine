# frozen_string_literal: true

module Api
  module Errors
    class BadRequest < StandardError; end
    class ValidationError < StandardError; end
    class RecordInvalidError < StandardError; end
  end
end
