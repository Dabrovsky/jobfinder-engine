# frozen_string_literal: true

require "test_helper"

class JobOffersTest < ActiveSupport::TestCase
  include MockedDataHelpers

  setup do
    stub_nofluffjobs_data
  end

  test "CommandHandler is included" do
    assert_includes JobOffers, CommandHandler
  end

  test ".fetch returns job_offers collection" do
    output = JobOffers.fetch(input: {})

    assert_instance_of Array, output
  end
end
