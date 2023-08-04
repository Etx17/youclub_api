module Types
  class MutationType < Types::BaseObject
    field :update_club, mutation: Mutations::UpdateClub
  end
end
