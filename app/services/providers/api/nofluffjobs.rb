# frozen_string_literal: true

module Providers
  module Api
    class Nofluffjobs < Common
      SOURCE = "nofluffjobs.com"
      API_PATH = "https://#{SOURCE}/api/search/posting".freeze
      STATIC_PATH = "https://static.#{SOURCE}".freeze

      def call
        response = fetch_data(API_PATH, body: body_params.to_json, query: query_params)
        return failed_response unless response.success?

        parsed_response = response.parsed_response
        parsed_response["postings"].map(&method(:response)).uniq { |entity| [entity[:title], entity[:company_name]] }
      end

      private

      def body_params
        {
          criteriaSearch: {
            requirement: [technology]
          }
        }
      end

      def query_params
        { salaryCurrency: currency, salaryPeriod: "month" }
      end

      def company_logo(data)
        [STATIC_PATH, data.dig("logo", "jobs_listing_2x")].join("/")
      end

      def salary_range(salary)
        salary_from = salary["from"]
        salary_to = salary["to"]
        reutrn unless salary_from.present? || salary_to.present?

        min = ActiveSupport::NumberHelper.number_to_delimited(salary_from.to_i, delimiter: " ")
        max = ActiveSupport::NumberHelper.number_to_delimited(salary_to.to_i, delimiter: " ")

        [min, max].join(" - ")
      end

      def extract_tags(data)
        data.dig("tiles", "values")&.pluck("value")
      end

      def external_slug(data)
        "https://#{SOURCE}/job/#{data['url']}"
      end

      def published_at(timestamp)
        Time.at(timestamp / 1000.0).iso8601
      end

      def response(data) # rubocop:disable Metrics/AbcSize
        {
          external_source: SOURCE,
          external_slug: external_slug(data),
          title: data["title"],
          category: data["category"],
          company_name: data["name"],
          company_logo: company_logo(data),
          seniority_level: data["seniority"][0],
          salary_range: salary_range(data["salary"]),
          salary_currency: data["salary"]["currency"],
          contract_types: Array.new(1, data["salary"]["type"]),
          tags: extract_tags(data),
          remote: data["fullyRemote"],
          published_at: published_at(data["posted"])
        }
      end
    end
  end
end
