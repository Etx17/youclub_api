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
  field :tarifications, [Types::TarificationType], null: false
  field :min_price_cents, Integer, null: true, method: :min_price_cents
  field :max_price_cents, Integer, null: true, method: :max_price_cents
  field :subscription_by_recurrence_price_cents, Integer, null: true, method: :subscription_by_recurrence_price_cents
  field :address, String, null: true
  field :zipcode, String, null: true

end

def tarifications
  object.tarifications
end
