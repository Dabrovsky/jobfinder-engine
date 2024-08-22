# frozen_string_literal: true

require "test_helper"

module Api
  module V1
    class JobOffersControllerTest < ActionDispatch::IntegrationTest
      attr_reader :job_offer

      setup do
        @job_offer = create(:job_offer)
      end

      test "GET api/v1/job_offers returns correct response" do
        expected_response = {
          external_slug: job_offer.external_slug,
          external_source: job_offer.external_source,
          title: job_offer.title,
          category: job_offer.category,
          company_logo: job_offer.company_logo,
          company_name: job_offer.company_name,
          seniority_level: job_offer.seniority_level,
          salary_range: job_offer.salary_range,
          salary_currency: job_offer.salary_currency,
          contract_types: job_offer.contract_types,
          tags: job_offer.tags,
          remote: job_offer.remote
        }

        get api_v1_job_offers_path

        assert_response :success
        assert_equal expected_response, json_response[:data][0][:attributes]
      end
    end
  end
end
