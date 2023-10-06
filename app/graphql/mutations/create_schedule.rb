module Mutations
  class CreateSchedule < BaseMutation
    argument :sub_group_id, ID, required: true
    argument :day, String, required: true
    type Types::ScheduleType

    def resolve(sub_group_id:, day:)
      schedule = Schedule.create!(
        sub_group_id: sub_group_id,
        day: day,
      )
      schedule
    end

  end
end
