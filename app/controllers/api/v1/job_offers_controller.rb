# frozen_string_literal: true

module Api
  module V1
    class JobOffersController < ApplicationController
      def index
        response = JobOffers.fetch(input: search_params)
        @pagy, records = pagy(response)

        render json: JobOfferSerializer.new(
          records,
          is_collection: true,
          meta: {
            pagination: {
              total_items: @pagy.count,
              per_page: @pagy.limit,
              current_page: @pagy.page
            }
          }
        ).serializable_hash
      end

      private

      def search_params
        params.permit(:currency, contracts: [], technologies: [], seniority: [], keywords: [])
      end
    end
  end
end
