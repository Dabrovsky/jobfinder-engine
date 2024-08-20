# frozen_string_literal: true

require "test_helper"

class JobOfferSerializerTest < ActiveSupport::TestCase
  attr_reader :input

  setup do
    @input = {
      title: "Job title",
      image: "image_path",
      company_name: "Company name",
      category: "Category name",
      seniority: "Mid",
      salary: {
        min: 0,
        max: 100,
        currency: "USD"
      },
      tags: ["Ruby"],
      remote: true,
      entity_url: "some-url",
      source: "source"
    }
  end

  test "correctly serializes object" do
    expected_hash = {
      type: :job_offer,
      attributes: input
    }

    assert_equal expected_hash, JobOfferSerializer.render(input)
  end

  test "correctly serializes collection" do
    collection = [input, input]

    expected_hash = [
      {
        type: :job_offer,
        attributes: input
      },
      {
        type: :job_offer,
        attributes: input
      }
    ]

    assert_equal expected_hash, JobOfferSerializer.render(collection)
  end

  test "correctly serializes only whitelisted fields" do
    combined_input = input.merge(additional_field: "test")

    expected_hash = {
      type: :job_offer,
      attributes: input
    }

    assert_equal expected_hash, JobOfferSerializer.render(combined_input)
  end
end
