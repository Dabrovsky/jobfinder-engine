# frozen_string_literal: true

require "test_helper"

class JobSerializerTest < ActiveSupport::TestCase
  attr_reader :input

  setup do
    @input = {
      status: "ok"
    }
  end

  test "correctly serializes object" do
    expected_hash = {
      type: :job,
      attributes: {
        status: "ok"
      }
    }

    assert_equal expected_hash, JobSerializer.render(input)
  end

  test "correctly serializes collection" do
    collection = [input, input]

    expected_hash = [
      {
        type: :job,
        attributes: {
          status: "ok"
        }
      },
      {
        type: :job,
        attributes: {
          status: "ok"
        }
      }
    ]

    assert_equal expected_hash, JobSerializer.render(collection)
  end

  test "correctly serializes only whitelisted fields" do
    combined_input = input.merge(additional_field: "test")

    expected_hash = {
      type: :job,
      attributes: {
        status: "ok"
      }
    }

    assert_equal expected_hash, JobSerializer.render(combined_input)
  end
end
