# frozen_string_literal: true

class JobOffer < ApplicationRecord
  EXTERNAL_SOURCES = %w[nofluffjobs.com].freeze

  validates :external_source, inclusion: { in: EXTERNAL_SOURCES }, presence: true
  validates :title, presence: true

  normalizes :category, :seniority_level, with: -> { _1&.squish&.downcase }
end
