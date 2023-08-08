module Mutations
  class CreateSchedule < BaseMutation
    class TimeSlotInputType < GraphQL::Schema::InputObject
      graphql_name 'TimeSlotInput'
      argument :start_time, String, required: true
      argument :end_time, String, required: true
    end

    argument :sub_group_id, ID, required: true
    argument :day, String, required: true
    argument :time_slots, [TimeSlotInputType], required: false

    type Types::ScheduleType

    def resolve(sub_group_id:, day:, time_slots: nil)
      converted_time_slots = time_slots&.map do |time_slot_input|
        TimeSlot.new(
          start_time: time_slot_input[:start_time],
          end_time: time_slot_input[:end_time]
        )
      end
      schedule = Schedule.create!(
        sub_group_id: sub_group_id,
        day: day,
        time_slots: converted_time_slots
      )
      schedule
    end

  end
end
