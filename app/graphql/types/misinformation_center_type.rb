# frozen_string_literal: true

module Types
  class MisinformationCenterType < Types::BaseObject
    field :id, ID, null: false
    field :state_id, Integer
    field :name, String
    field :address, String
    field :source, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :city, String
    field :zip, String
  end
end
