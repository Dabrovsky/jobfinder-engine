# frozen_string_literal: true

require "test_helper"

class JobOfferSerializerTest < ActiveSupport::TestCase
  attr_reader :job_offer, :attributes

  setup do
    @job_offer = create(:job_offer)
    @attributes = {
      external_slug: job_offer.external_slug,
      external_source: job_offer.external_source,
      title: job_offer.title,
      category: job_offer.category,
      company_name: job_offer.company_name,
      company_logo: job_offer.company_logo,
      seniority_level: job_offer.seniority_level,
      salary_range: job_offer.salary_range,
      salary_currency: job_offer.salary_currency,
      tags: job_offer.tags,
      contract_types: job_offer.contract_types,
      remote: job_offer.remote
    }
  end

  test "correctly serializes object" do
    expected_hash = {
      data: {
        id: job_offer.id,
        type: :job_offer,
        attributes:
      }
    }

    assert_equal expected_hash, JobOfferSerializer.new(job_offer).serializable_hash
  end

  test "correctly serializes collection" do
    job_offer_two = create(:job_offer)
    collection = JobOffer.all

    attributes2 = {
      external_slug: job_offer_two.external_slug,
      external_source: job_offer_two.external_source,
      title: job_offer_two.title,
      category: job_offer_two.category,
      company_name: job_offer_two.company_name,
      company_logo: job_offer_two.company_logo,
      seniority_level: job_offer_two.seniority_level,
      salary_range: job_offer_two.salary_range,
      salary_currency: job_offer_two.salary_currency,
      tags: job_offer_two.tags,
      contract_types: job_offer_two.contract_types,
      remote: job_offer_two.remote
    }

    expected_hash = {
      data: [
        {
          id: job_offer.id,
          type: :job_offer,
          attributes:
        },
        {
          id: job_offer_two.id,
          type: :job_offer,
          attributes: attributes2
        }
      ]
    }

    assert_equal expected_hash, JobOfferSerializer.new(collection, is_collection: true).serializable_hash
  end
end
