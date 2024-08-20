# frozen_string_literal: true

module JobOffers
  class List < Command
    include ActiveData::Model

    PROVIDERS = [
      Providers::Api::Nofluffjobs
    ].freeze

    attribute :currency, String, default: "USD"
    attribute :technologies, Array, default: []

    def call
      job_offers
    end

    private

    def job_offers
      providers.map(&:call).flatten
    end

    def providers
      PROVIDERS.map do |provider|
        provider.new(currency:, technologies:)
      end
    end
  end
end
