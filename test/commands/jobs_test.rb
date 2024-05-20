# frozen_string_literal: true

require "test_helper"

class JobsTest < ActiveSupport::TestCase
  include MockedDataHelpers

  setup do
    stub_nofluffjobs_data
  end

  test "CommandHandler is included" do
    assert_includes Jobs, CommandHandler
  end

  test ".fetch returns jobs collection" do
    output = Jobs.fetch(input: {})

    assert_instance_of Array, output
  end
end
