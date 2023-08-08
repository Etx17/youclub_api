module Types
  class TimeSlotType < Types::BaseObject
    field :id, ID, null: false
    field :startTime, String, null: true, method: :start_time
    field :endTime, String, null: true, method: :end_time
  end
end
