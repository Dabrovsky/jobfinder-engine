# frozen_string_literal: true

require "test_helper"

module Providers
  class FetchRecordsJobTest < ActiveJob::TestCase
    attr_reader :params

    setup do
      @params = {
        provider: "nofluffjobs",
        technology: "Ruby"
      }
    end

    test "#perform calls Providers fetch_records command" do
      Providers.expects(:fetch_records).with(input: params).once

      FetchRecordsJob.perform_now(**params)
    end

    test "#perform does fail the operation on standard errors" do
      message = "whatever"
      exception = StandardError.new(message)

      Providers.stubs(:fetch_records).raises(exception).once

      assert_raise(StandardError) { FetchRecordsJob.perform_now(**params) }
      assert_no_enqueued_jobs
    end
  end
end
