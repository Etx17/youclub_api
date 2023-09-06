module Mutations
  class CreateSubGroup < BaseMutation
    argument :activity_id, ID, required: true
    argument :name, String, required: false
    argument :min_price, Float, required: true
    argument :class_type, String, required: false
    argument :short_description, String, required: false
    argument :subscriptionByRecurrencePrice, Float, required: false
    argument :tarifications, [String], required: false

    type Types::SubGroupType

    def resolve(activity_id:, name: nil, min_price:, class_type: nil, short_description: nil, subscription_by_recurrence_price: nil, tarifications: nil)
      sub_group = SubGroup.create!(
        activity_id: activity_id,
        name: name,
        min_price: min_price ? min_price : nil,
        class_type: class_type,
        short_description: short_description,
        subscription_by_recurrence_price: subscription_by_recurrence_price ? (subscription_by_recurrence_price * 100).round : nil,
        tarifications: tarifications
      )
      sub_group
    end
  end
end
