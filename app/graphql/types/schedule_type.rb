class Types::ScheduleType < Types::BaseObject
  field :id, ID, null: false
  field :subGroupId, ID, null: false, method: :sub_group_id
  field :day, String, null: true
  field :timeSlots, [Types::TimeSlotType], null: false, method: :time_slots
  field :createdAt, GraphQL::Types::ISO8601DateTime, null: false, method: :created_at
  field :updatedAt, GraphQL::Types::ISO8601DateTime, null: false, method: :updated_at
end
