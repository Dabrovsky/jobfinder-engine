# frozen_string_literal: true

class JobSerializer < Serializer
  self.type = :job

  fields :status
end
