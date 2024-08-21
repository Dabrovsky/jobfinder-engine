# frozen_string_literal: true

module Providers
  class Fetch < Command
    include ActiveData::Model

    ERROR_MESSAGES = [
      INVALID_PARAMETER_ERROR = "Invalid parameters provided",
      RECORD_INVALID_ERROR = "JobOffer creation failed due to a validation error"
    ].freeze
    PROVIDERS = {
      "nofluffjobs" => Providers::Api::Nofluffjobs
    }.freeze

    attribute :provider, String
    attribute :currency, String, default: "USD"
    attribute :technology, String

    validates :provider, inclusion: { in: PROVIDERS.keys }, presence: true

    def call
      validate_input!
      save!
    end

    private

    def validate_input!
      validate!
    rescue ActiveData::ValidationError
      raise ::Api::Errors::ValidationError, INVALID_PARAMETER_ERROR
    end

    def save!
      ActiveRecord::Base.transaction do
        fetched_entities.each do |attributes|
          updated_at = Time.zone.now
          record = JobOffer.find_or_initialize_by(
            external_source: attributes[:external_source],
            title: attributes[:title],
            company_name: attributes[:company_name]
          )
          record.update!(attributes.merge(updated_at:))
        end
      end
    rescue ActiveRecord::RecordInvalid
      raise Api::Errors::RecordInvalidError, RECORD_INVALID_ERROR
    end

    def fetched_entities
      provider_instance.call
    end

    def provider_instance
      @provider_instance ||= PROVIDERS[provider].new(currency:, technology:)
    end
  end
end
