# frozen_string_literal: true

require "test_helper"

class JobOfferTest < ActiveSupport::TestCase
  attr_reader :job_offer

  setup do
    @job_offer = build(:job_offer)
  end

  test "is valid" do
    assert job_offer.valid?
  end

  test "is invalid without external_source" do
    job_offer.external_source = nil

    assert job_offer.invalid?
  end

  test "is invalid without title" do
    job_offer.title = nil

    assert job_offer.invalid?
  end

  test "is invalid with invalid external_source" do
    job_offer.external_source = "wrong"

    assert job_offer.invalid?
  end

  test "normalizes category" do
    job_offer.category = "  Ruby "

    assert_equal "ruby", job_offer.category
  end

  test "normalizes seniority_level" do
    job_offer.seniority_level = "  Mid "

    assert_equal "mid", job_offer.seniority_level
  end

  test "normalizes tags" do
    job_offer.tags = ["Ruby"]

    assert_equal ["ruby"], job_offer.tags
  end
end
