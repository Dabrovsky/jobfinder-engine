# frozen_string_literal: true

FactoryBot.define do
  factory :job_offer do
    external_source { "nofluffjobs.com" }
    external_slug { "/example" }
    title { "Backend developer" }
    category { "Ruby" }
    company_name { "Acme" }
    company_logo { "/example.jpg" }
    seniority_level { "Mid" }
    salary_range { "10000-20000" }
    salary_currency { "USD" }
  end
end
