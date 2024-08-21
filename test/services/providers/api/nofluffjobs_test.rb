# frozen_string_literal: true

require "test_helper"

module Providers
  module Api
    class NofluffjobsTest < ActiveSupport::TestCase
      include MockedDataHelpers

      attr_reader :provider

      setup do
        @provider = Nofluffjobs.new(currency: "USD")
        stub_nofluffjobs_data
      end

      test ".fetch_jobs returns collection" do
        response = provider.call

        assert_instance_of Array, response
      end
    end
  end
end
