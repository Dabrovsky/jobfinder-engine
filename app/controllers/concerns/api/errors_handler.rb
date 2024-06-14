# frozen_string_literal: true

module Api
  module ErrorsHandler
    extend ActiveSupport::Concern

    included do
      rescue_from StandardError, with: :internal_server_error
      rescue_from Api::Errors::BadRequest, with: :bad_request
    end

    private

    def internal_server_error(_exception)
      render json: {
        status: 500, message: "Something went wrong"
      }, status: :internal_server_error
    end

    def bad_request(exception)
      render json: {
        status: 400, message: exception.message
      }, status: :bad_request
    end
  end
end
