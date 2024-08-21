# frozen_string_literal: true

# == Schema Information
#
# Table name: job_offers
#
#  id              :uuid             not null, primary key
#  external_source :text             not null
#  external_slug   :text
#  title           :text             not null
#  category        :text
#  company_name    :text
#  company_logo    :text
#  seniority_level :text
#  salary_range    :text
#  salary_currency :text
#  contract_types  :text             default([]), is an Array
#  tags            :text             default([]), is an Array
#  remote          :boolean          default(FALSE), not null
#  published_at    :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class JobOffer < ApplicationRecord
  EXTERNAL_SOURCES = %w[nofluffjobs.com].freeze

  validates :external_source, inclusion: { in: EXTERNAL_SOURCES }, presence: true
  validates :title, presence: true

  normalizes :category, :seniority_level, with: -> { _1&.squish&.downcase }
  normalizes :tags, with: -> { _1&.map(&:downcase) }
end
