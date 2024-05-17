# frozen_string_literal: true

require "test_helper"

module Api
  module V1
    class JobsControllerTest < ActionDispatch::IntegrationTest
      test "GET api/v1/jobs/search returns correct response" do
        expected_response = {
          type: "job",
          attributes: {
            status: "ok"
          }
        }

        get search_api_v1_jobs_path

        assert_response :success
        assert_equal expected_response, json_response
      end
    end
  end
end
