# frozen_string_literal: true

module Api
  module V1
    class JobsController < ApplicationController
      def search
        response = {
          status: :ok
        }

        render json: JobSerializer.render(response)
      end
    end
  end
end
