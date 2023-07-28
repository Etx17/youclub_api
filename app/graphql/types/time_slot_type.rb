module Types
  class TimeSlotType < Types::BaseObject
    field :id, ID, null: false
    field :startTime, String, null: true, method: :start_time
    field :endTime, String, null: true, method: :end_time
    field :createdAt, GraphQL::Types::ISO8601DateTime, null: false, method: :created_at
    field :updatedAt, GraphQL::Types::ISO8601DateTime, null: false, method: :updated_at
  end
end
