# frozen_string_literal: true

module MockedDataHelpers
  def stub_nofluffjobs_data
    mocked_response = file_fixture("nofluffjobs/api/search.json").read
    stub_request(:post, "https://nofluffjobs.com/api/search/posting?salaryCurrency=USD&salaryPeriod=month")
      .to_return(status: 200, body: mocked_response, headers: { "Content-Type": "application/json" })
  end
end

module ActionDispatch
  class IntegrationTest
    include MockedDataHelpers
  end
end
