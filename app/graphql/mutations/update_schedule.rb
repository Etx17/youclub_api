module Mutations
  class UpdateSchedule < BaseMutation

    class TimeSlotUpdateInputType < GraphQL::Schema::InputObject
      graphql_name 'TimeSlotUpdateInput'
      argument :start_time, String, required: true
      argument :end_time, String, required: true
    end

    argument :id, ID, required: true
    argument :time_slots, [TimeSlotUpdateInputType], required: true

    type Types::ScheduleType

    def resolve(id:, timeslots:)
      converted_time_slots = time_slots&.map do |time_slot_input|
        TimeSlot.new(
          start_time: time_slot_input[:start_time],
          end_time: time_slot_input[:end_time]
        )
      end

      schedule = Schedule.find(id)
      schedule.update!(
        time_slots: converted_time_slots
      )
    end
  end
end
