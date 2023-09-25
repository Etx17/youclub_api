module Mutations
  class CreateTimeSlot < BaseMutation
    argument :schedule_id, ID, required: true
    argument :start_time, String, required: true
    argument :end_time, String, required: true

    type Types::TimeSlotType

    def resolve(schedule_id:, start_time:, end_time:)
     TimeSlot.create!(
        schedule_id: schedule_id,
        start_time: start_time,
        end_time: end_time
      )
    end
  end
end
