# frozen_string_literal: true

module JobOffers
  class List < Command
    include ActiveData::Model

    PROVIDERS = [
      Providers::Api::Nofluffjobs
    ].freeze

    attribute :currency, String, default: "USD"
    attribute :technology, String

    def call
      job_offers
    end

    private

    def job_offers
      providers.map(&:call).flatten
    end

    def providers
      PROVIDERS.map do |provider|
        provider.new(currency:, technology:)
      end
    end
  end
end
