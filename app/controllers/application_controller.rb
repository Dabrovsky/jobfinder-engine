# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Api::ErrorsHandler
  include Pagy::Backend
end
