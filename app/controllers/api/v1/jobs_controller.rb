# frozen_string_literal: true

module Api
  module V1
    class JobsController < ApplicationController
      def index
        jobs = Jobs.fetch(input: search_params)

        render json: JobSerializer.render(jobs)
      end

      private

      def search_params
        params.permit(:currency, contracts: [], technologies: [], seniority: [], keywords: [])
      end
    end
  end
end
