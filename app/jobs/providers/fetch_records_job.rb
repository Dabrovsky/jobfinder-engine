# frozen_string_literal: true

module Providers
  class FetchRecordsJob < ApplicationJob
    queue_as :high

    def perform(**input)
      Providers.fetch_records(input:)
    rescue StandardError => e
      Rails.logger.error "Error processing job: #{e.message}"

      raise
    end
  end
end
