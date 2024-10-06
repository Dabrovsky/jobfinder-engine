# frozen_string_literal: true

require "test_helper"

module Api
  module V1
    class JobOffersControllerTest < ActionDispatch::IntegrationTest
      attr_reader :job_offer

      setup do
        @job_offer = create(:job_offer)
      end

      test "GET api/v1/job_offers returns correct response object and pagination" do
        expected_response = {
          data: [
            id: job_offer.id,
            type: "job_offer",
            attributes: {
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
          ],
          meta: {
            pagination: {
              total_items: 1,
              per_page: 20,
              current_page: 1
            }
          }
        }

        get api_v1_job_offers_path

        assert_response :success
        assert_equal expected_response, json_response
      end

      test "GET api/v1/job_offers returns a list of records filtered by technologies" do
        job_offer = create(:job_offer, tags: %w[ruby php kotlin])
        _job_offer = create(:job_offer, tags: %w[javascript java golang])

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

        get api_v1_job_offers_path(technologies: %w[kotlin])

        assert_response :success
        assert_equal 1, json_response[:data].count
        assert_equal expected_response, json_response[:data][0][:attributes]
      end

      test "GET api/v1/job_offers returns a list of records filtered by seniority" do
        job_offer = create(:job_offer, seniority_level: "junior")
        _job_offer = create(:job_offer, seniority_level: "senior")

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

        get api_v1_job_offers_path(seniority: %w[junior])

        assert_response :success
        assert_equal 1, json_response[:data].count
        assert_equal expected_response, json_response[:data][0][:attributes]
      end

      test "GET api/v1/job_offers returns a list of records filtered by contracts" do
        job_offer = create(:job_offer, contract_types: %w[b2b])
        _job_offer = create(:job_offer, contract_types: %w[permanent])

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

        get api_v1_job_offers_path(contracts: %w[b2b])

        assert_response :success
        assert_equal 1, json_response[:data].count
        assert_equal expected_response, json_response[:data][0][:attributes]
      end

      test "GET api/v1/job_offers returns a list of records filtered by keywords" do
        job_offer = create(:job_offer, tags: %w[backend])
        _job_offer = create(:job_offer, tags: %w[frontend])

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

        get api_v1_job_offers_path(keywords: %w[backend])

        assert_response :success
        assert_equal 1, json_response[:data].count
        assert_equal expected_response, json_response[:data][0][:attributes]
      end
    end
  end
end
