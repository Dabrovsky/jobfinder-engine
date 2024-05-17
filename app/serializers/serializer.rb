# frozen_string_literal: true

class Serializer < Blueprinter::Base
  class << self
    attr_accessor :type, :identifier

    def inherited(subclass)
      super
      subclass.type = nil
      subclass.identifier = nil
    end

    def render(data)
      return build_object(data) unless data.instance_of? Array

      data.map(&method(:build_object))
    end

    private

    def build_object(data)
      {
        id: data[identifier],
        type:,
        attributes: render_as_hash(data)
      }.compact
    end
  end
end
