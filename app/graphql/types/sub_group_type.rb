class Types::SubGroupType < Types::BaseObject
  field :id, ID, null: false
  field :activityId, ID, null: false, method: :activity_id
  field :name, String, null: false
  field :minPrice, Float, null: true, method: :min_price
  field :recurrence, String, null: true
  field :classType, String, null: true, method: :class_type
  field :shortDescription, String, null: true, method: :short_description
  field :subscriptionByRecurrencePrice, Float, null: true, method: :subscription_by_recurrence_price
  field :schedules, [Types::ScheduleType], null: false
  field :tarifications, [String], null: true
end
