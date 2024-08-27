# frozen_string_literal: true

require "test_helper"

module JobOffers
  class FetchQueryTest < ActiveSupport::TestCase
    test "Query returns records filtered by tags" do
      job_offer = create(:job_offer, tags: %w[ruby backend])
      _job_offer = create(:job_offer, tags: %w[javascript frontend])

      input = { keywords: %w[backend] }
      query_result = FetchQuery.search(**input)

      assert_equal 1, query_result.count
      assert_equal job_offer, query_result[0]
    end

    test "Query returns records filtered by contracts" do
      job_offer = create(:job_offer, contract_types: %w[b2b])
      _job_offer = create(:job_offer, contract_types: %w[permanent])

      input = { contracts: %w[b2b] }
      query_result = FetchQuery.search(**input)

      assert_equal 1, query_result.count
      assert_equal job_offer, query_result[0]
    end

    test "Query returns records filtered by seniority" do
      job_offer = create(:job_offer, seniority_level: "junior")
      _job_offer = create(:job_offer, seniority_level: "senior")

      input = { seniority: %w[junior] }
      query_result = FetchQuery.search(**input)

      assert_equal 1, query_result.count
      assert_equal job_offer, query_result[0]
    end

    test "Query returns empty array when no records found" do
      input = {}
      query_result = FetchQuery.search(**input)

      assert_empty query_result
    end
  end
end
