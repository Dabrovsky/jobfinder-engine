# frozen_string_literal: true

module JobOffers
  class List < Command
    include ActiveData::Model

    attribute :currency, String, default: "USD"
    attribute :technologies, Array, default: []

    def call
      job_offers
    end

    private

    def job_offers
      JobOffer.where("tags @> ?", "{#{technologies.join(',')}}")
    end
  end
end
