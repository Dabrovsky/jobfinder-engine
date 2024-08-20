# frozen_string_literal: true

module JobOffers
  include CommandHandler

  module_function

  # Retrieve a list of job offers
  #
  # @example
  #   JobOffers.fetch(
  #     input: {
  #       currency: "USD",
  #       technologies: ["ruby"]
  #     }
  #   )
  def fetch(input: {})
    invoke_command(
      input:,
      command: List
    )
  end
end
