module Types
  class MutationType < Types::BaseObject
    field :update_club, mutation: Mutations::UpdateClub
    field :create_activity, mutation: Mutations::CreateActivity
    field :update_activity, mutation: Mutations::UpdateActivity
    field :create_sub_group, mutation: Mutations::CreateSubGroup
  end
end
