module Mutations
  class DeleteSubGroup < BaseMutation
    argument :id, ID, required: true

    type Types::SubGroupType

    def resolve(id:)
      sub_group = SubGroup.find(id)
      sub_group.destroy!
      sub_group
    end
  end
end
