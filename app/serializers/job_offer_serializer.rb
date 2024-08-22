# frozen_string_literal: true

class JobOfferSerializer
  include JSONAPI::Serializer

  attributes :external_source,
             :external_slug,
             :title,
             :category,
             :company_name,
             :company_logo,
             :seniority_level,
             :salary_range,
             :salary_currency,
             :contract_types,
             :tags,
             :remote
end
