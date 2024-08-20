# frozen_string_literal: true

class JobOfferSerializer < Serializer
  self.type = :job_offer

  fields :title, :image, :company_name, :category, :seniority, :salary, :tags, :remote, :entity_url, :source
end
