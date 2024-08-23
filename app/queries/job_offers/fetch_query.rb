# frozen_string_literal: true

module JobOffers
  class FetchQuery < BaseQuery
    attribute :currency, String, default: "USD"
    attribute :technologies, Array, default: []
    attribute :seniority, Array, default: []
    attribute :contracts, Array, default: []
    attribute :keywords, Array, default: []

    def search
      search_by_tags
      search_by_contracts
      search_by_seniority
      scope
    end

    private

    def scope
      @scope || JobOffer.active
    end

    def search_by_tags
      return if technologies.blank? && keywords.blank?

      tags = [technologies, keywords].flatten.join(",")
      @scope = scope.where("tags @> ?", "{#{tags}}")
    end

    def search_by_contracts
      return if contracts.blank?

      contracts_types = contracts.join(",")
      @scope = scope.where("contract_types @> ?", "{#{contracts_types}}")
    end

    def search_by_seniority
      return if seniority.blank?

      @scope = scope.where(seniority_level: seniority)
    end
  end
end
