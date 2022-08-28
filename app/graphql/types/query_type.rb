module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :states, [StateType], null: true do
      description 'gets all state'
    end
    def states
      State.all
    end

    field :state, StateType, null: true do
      description 'find state by abbreviation'
      argument :abbreviation, String, required: true
    end
    def state(abbreviation:)
      State.find_by(abbreviation: abbreviation)
    end
  end
end
