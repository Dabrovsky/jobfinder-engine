# frozen_string_literal: true

module Providers
  module Api
    class Nofluffjobs < Common
      API_PATH = "https://nofluffjobs.com/api/search/posting"
      STATIC_PATH = "https://static.nofluffjobs.com"
      CONTRACT_TYPES = {
        "b2b" => "b2b",
        "permanent" => "permanent",
        "mandate" => "zlecenie",
        "intern" => "intern"
      }.freeze

      def call
        response = fetch_data(API_PATH, body: body_params.to_json, query: query_params)
        return failed_response unless response.success?

        parsed_response = response.parsed_response
        parsed_response["postings"].map(&method(:response)).uniq
      end

      private

      def body_params
        {
          criteriaSearch: {
            employment: mapped_contracts,
            requirement: technologies,
            seniority:,
            keyword: keywords
          }
        }
      end

      def query_params
        { salaryCurrency: currency, salaryPeriod: "month" }
      end

      def mapped_contracts
        contracts.map(&CONTRACT_TYPES.method(:[]))
      end

      def image_url(data)
        [STATIC_PATH, data.dig("logo", "jobs_listing_2x")].join("/")
      end

      def salary_details(data)
        {
          min: data.dig("salary", "from"),
          max: data.dig("salary", "to"),
          currency: data.dig("salary", "currency")
        }
      end

      def extract_tags(data)
        data.dig("tiles", "values")&.pluck("value")
      end

      def response(data)
        {
          title: data["title"],
          image: image_url(data),
          company_name: data["name"],
          category: data["category"],
          seniority: data["seniority"],
          salary: salary_details(data),
          tags: extract_tags(data),
          remote: data["fullyRemote"]
        }
      end
    end
  end
end
