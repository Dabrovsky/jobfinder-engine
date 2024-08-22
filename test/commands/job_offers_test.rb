# frozen_string_literal: true

require "test_helper"

class JobOffersTest < ActiveSupport::TestCase
  test "CommandHandler is included" do
    assert_includes JobOffers, CommandHandler
  end

  test ".fetch returns a collection" do
    job_offer = create(:job_offer)
    input = {}

    output = JobOffers.fetch(input:)

    assert_equal [job_offer.id], output.ids
  end
end
