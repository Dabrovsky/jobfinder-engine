# frozen_string_literal: true

module Providers
  include CommandHandler

  module_function

  # Retrieve a list of job offers from external source and store them in the database
  #
  # @example
  #   Providers.fetch_records(
  #     input: {
  #       provider: "nofluffjobs",
  #       currency: "USD",
  #       technology: "ruby"
  #     }
  #   )
  def fetch_records(input: {})
    invoke_command(
      input:,
      command: Fetch
    )
  end
end
