class Types::ActivityType < Types::BaseObject
  field :id, ID, null: false
  field :name, String, null: false
  field :geoPoint, String, null: true, method: :geo_point
  field :category, String, null: true
  field :address, String, null: true
  field :actualZipcode, String, null: true, method: :actual_zipcode
  field :freeTrial, Boolean, null: true, method: :free_trial
  field :isLookingForVolunteer, Boolean, null: true, method: :is_looking_for_volunteer
  field :subcategories, String, null: false
  field :recurrence, String, null: true
  field :subscriptionLink, String, null: true, method: :subscription_link
  field :shortDescription, String, null: true, method: :short_description
  field :fullDescription, String, null: true, method: :full_description
  field :club, Types::ClubType, null: false

  field :subGroups, [Types::SubGroupType], null: false, method: :sub_groups

  def sub_groups
    object.sub_groups
  end

  def club
    object.club
  end

  def subcategories
    object.subcategories
  end

end
