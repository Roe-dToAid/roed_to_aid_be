# frozen_string_literal: true

module Types
  class AuthorizedClinicType < Types::BaseObject
    field :id, ID, null: false
    field :state_id, Integer
    field :name, String
    field :city, String
    field :zip, String
    field :phone, String
    field :services, String
    field :website, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :address, String
    field :source, String
  end
end
