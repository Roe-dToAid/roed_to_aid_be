# frozen_string_literal: true

module Types
  class StateType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :abbreviation, String
    field :legal, String
    field :legal_description, String
    field :source, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :resources, [ResourceType], null: true
    field :misinformation_centers, [MisinformationCenterType], null: true
    field :authorized_clinics, [AuthorizedClinicType], null: true
  end
end
