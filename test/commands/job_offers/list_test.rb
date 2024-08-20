# frozen_string_literal: true

require "test_helper"

module JobOffers
  class ListTest < ActiveSupport::TestCase
    include MockedDataHelpers

    setup do
      stub_nofluffjobs_data
    end

    test "List class inherits from Command class" do
      assert_equal Command, List.superclass
    end

    test "Returns an array as response" do
      input = {}
      output = List.new(**input).call

      assert_equal 1, output.count
    end
  end
end
