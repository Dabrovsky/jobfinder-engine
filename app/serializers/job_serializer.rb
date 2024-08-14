# frozen_string_literal: true

class JobSerializer < Serializer
  self.type = :job

  fields :title, :image, :company_name, :category, :seniority, :salary, :tags, :remote, :entity_url, :source
end
