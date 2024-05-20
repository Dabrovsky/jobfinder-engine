# frozen_string_literal: true

module Jobs
  include CommandHandler

  module_function

  # Retrieve a list of jobs
  #
  # @example
  #   Jobs.fetch(
  #     input: {
  #       currency: "USD",
  #       contracts: ["permanent"],
  #       technologies: ["ruby"],
  #       seniority: ["mid"],
  #       keywords: ["some", "keywords", "here"]
  #     }
  #   )
  def fetch(input: {})
    invoke_command(
      input:,
      command: List
    )
  end
end
