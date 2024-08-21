# frozen_string_literal: true

require "test_helper"

class ProvidersTest < ActiveSupport::TestCase
  include MockedDataHelpers

  setup do
    stub_nofluffjobs_data
  end

  test "CommandHandler is included" do
    assert_includes Providers, CommandHandler
  end

  test ".fetch_records returns collection" do
    input = { provider: "nofluffjobs" }
    output = Providers.fetch_records(input:)

    assert_instance_of Array, output
  end
end
