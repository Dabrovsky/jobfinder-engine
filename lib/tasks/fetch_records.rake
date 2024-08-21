# frozen_string_literal: true

namespace :providers do
  desc "Call providers to sync the records"
  task fetch_records: :environment do
    Providers::Fetch::PROVIDERS.each_key do |provider|
      TECHNOLOGIES.each do |technology|
        input = { provider:, technology:, currency: "PLN" }
        Providers::FetchRecordsJob.perform_later(**input)
      end
    end
  end
end
