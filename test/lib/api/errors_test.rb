# frozen_string_literal: true

require "test_helper"

module Api
  class ErrorsTest < ActiveSupport::TestCase
    test "BadRequest class inherits from StandardError class" do
      assert_equal StandardError, Api::Errors::BadRequest.superclass
    end

    test "ValidationError class inherits from StandardError class" do
      assert_equal StandardError, Api::Errors::ValidationError.superclass
    end

    test "RecordInvalidError class inherits from StandardError class" do
      assert_equal StandardError, Api::Errors::RecordInvalidError.superclass
    end
  end
end
