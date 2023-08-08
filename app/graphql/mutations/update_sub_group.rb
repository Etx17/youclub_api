module Mutations
  class UpdateSubGroup < BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :min_price, Float, required: false
    argument :class_type, String, required: false
    argument :short_description, String, required: false
    argument :subscriptionByReccurencePrice, Float, required: false
    argument :tarifications, [String], required: false

    type Types::SubGroupType

    def resolve(id:, name: nil, min_price: nil, class_type: nil, short_description: nil, subscription_by_reccurence_price: nil, tarifications: nil)
      sub_group = SubGroup.find(id)
      sub_group.update!(
        name: name || sub_group.name,
        min_price: min_price || sub_group.min_price,
        class_type: class_type || sub_group.class_type,
        short_description: short_description || sub_group.short_description,
        tarifications: tarifications || sub_group.tarifications
      )
      sub_group
    end
  end
end
