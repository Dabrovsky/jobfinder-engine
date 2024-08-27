# frozen_string_literal: true

module JobOffers
  class List < Command
    include ActiveData::Model

    attribute :currency, String, default: "USD"
    attribute :technologies, Array, default: []
    attribute :seniority, Array, default: []
    attribute :contracts, Array, default: []
    attribute :keywords, Array, default: []

    def call
      JobOffers::FetchQuery.search(**input)
    end

    private

    def input
      {
        technologies:,
        seniority:,
        contracts:,
        keywords:
      }
    end
  end
end
