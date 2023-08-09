module Mutations
  class DeleteSchedule < BaseMutation
    argument :id, ID, required: true

    type Types::ScheduleType

    def resolve(id:)
      schedule = Schedule.find(id)
      schedule.destroy!
      schedule
    end
  end
end
