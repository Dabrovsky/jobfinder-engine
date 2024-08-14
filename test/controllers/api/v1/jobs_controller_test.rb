# frozen_string_literal: true

require "test_helper"

module Api
  module V1
    class JobsControllerTest < ActionDispatch::IntegrationTest
      include MockedDataHelpers

      setup do
        stub_nofluffjobs_data
      end

      test "GET api/v1/jobs returns correct response" do
        expected_response = {
          title: "Job title",
          image: "https://static.nofluffjobs.com/image_path",
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
          entity_url: "https://nofluffjobs.com/job/some-url",
          source: "nofluffjobs.com"
        }

        get api_v1_jobs_path

        assert_response :success
        assert_equal expected_response, json_response[0][:attributes]
      end
    end
  end
end
