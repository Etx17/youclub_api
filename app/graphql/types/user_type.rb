module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: true
    field :sub_id, String, null: true
    field :createdAt, GraphQL::Types::ISO8601DateTime, null: false, method: :created_at
    field :updatedAt, GraphQL::Types::ISO8601DateTime, null: false, method: :updated_at
  end
end
