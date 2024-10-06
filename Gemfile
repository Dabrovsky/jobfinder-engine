# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.3.1"

gem "active_data"
gem "bootsnap", require: false
gem "httparty"
gem "jsonapi-serializer"
gem "pagy"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "rack-cors"
gem "rails", "~> 7.1.3", ">= 7.1.3.3"
gem "solid_queue"
gem "tzinfo-data", platforms: %i[windows jruby]
gem "whenever", require: false

group :development, :test do
  gem "annotate"
  gem "debug", platforms: %i[mri windows]
  gem "factory_bot_rails"
  gem "rubocop-rails", require: false
  gem "webmock"
end

group :development do
  # gem "spring"
end

group :test do
  gem "mocha"
end
