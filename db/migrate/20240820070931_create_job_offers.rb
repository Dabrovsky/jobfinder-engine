# frozen_string_literal: true

class CreateJobOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :job_offers, id: :uuid do |t|
      t.text :external_source, null: false
      t.text :external_slug
      t.text :title, null: false
      t.text :category
      t.text :company_name
      t.text :company_logo
      t.text :seniority_level
      t.text :salary_range
      t.text :salary_currency
      t.text :contract_types, array: true, default: []
      t.text :tags, array: true, default: []
      t.boolean :remote, null: false, default: false
      t.datetime :published_at
      t.timestamps
    end
  end
end
