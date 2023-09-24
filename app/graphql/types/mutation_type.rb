module Types
  class MutationType < Types::BaseObject
    field :update_club, mutation: Mutations::UpdateClub
    field :create_activity, mutation: Mutations::CreateActivity
    field :update_activity, mutation: Mutations::UpdateActivity
    field :create_sub_group, mutation: Mutations::CreateSubGroup
    field :update_sub_group, mutation: Mutations::UpdateSubGroup
    field :delete_sub_group, mutation: Mutations::DeleteSubGroup
    field :create_schedule, mutation: Mutations::CreateSchedule
    field :update_schedule, mutation: Mutations::UpdateSchedule
    field :delete_schedule, mutation: Mutations::DeleteSchedule
    field :delete_activity, mutation: Mutations::DeleteActivity
    field :delete_time_slot, mutation: Mutations::DeleteTimeSlot
    field :create_user, mutation: Mutations::CreateUser
  end
end
