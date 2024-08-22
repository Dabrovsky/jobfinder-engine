# frozen_string_literal: true

module Api
  module V1
    class JobOffersController < ApplicationController
      def index
        job_offers = JobOffers.fetch(input: search_params)

        render json: JobOfferSerializer.new(
          job_offers,
          is_collection: true
        ).serializable_hash
      end

      private

      def search_params
        params.permit(:currency, contracts: [], technologies: [], seniority: [], keywords: [])
      end
    end
  end
end
