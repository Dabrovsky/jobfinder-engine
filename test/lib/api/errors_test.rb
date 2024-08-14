# frozen_string_literal: true

require "test_helper"

module Api
  class ErrorsTest < ActiveSupport::TestCase
    test "BadRequest class inherits from StandardError class" do
      assert_equal StandardError, Api::Errors::BadRequest.superclass
    end
  end
end
