module Mutations
  class DeleteTimeSlot < BaseMutation
    argument :id, ID, required: true

    type Types::TimeSlotType
    
    def resolve(id:)
      time_slot = TimeSlot.find(id)
      time_slot.destroy!
      time_slot
    end
  end
end
