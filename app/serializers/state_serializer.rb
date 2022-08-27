# frozen_string_literal: true

class StateSerializer
  include JSONAPI::Serializer
  attributes :name, :abbreviation, :legal, :legal_description, :source
end
