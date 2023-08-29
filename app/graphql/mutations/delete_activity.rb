module Mutations
  class DeleteActivity < BaseMutation
    argument :id, ID, required: true

    type Types::ActivityType

    def resolve(id:)
      activity = Activity.find(id)
      activity.destroy!
      activity
    end
  end
end
