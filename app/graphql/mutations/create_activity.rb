module Mutations
  class CreateActivity < BaseMutation
    argument :club_id, ID, required: true
    argument :name, String, required: false
    argument :category, String, required: false
    argument :subcategories, String, required: false
    argument :short_description, String, required: false
    argument :full_description, String, required: false
    argument :address, String, required: false
    argument :free_trial, Boolean, required: false
    argument :actual_zipcode, String, required: false
    argument :recurrence, String, required: false
    argument :images, [String], required: false

    type Types::ActivityType

    def resolve(club_id: nil, name: nil, category: nil, subcategories: nil, short_description: nil, full_description: nil, address: nil, free_trial: nil, actual_zipcode: nil, recurrence: nil, images: nil)
      club = Club.find(club_id)
      activity = Activity.create!(
        name: name,
        club_id: club_id,
        geo_point: club.geo_point,
        address: address || club.address,
        actual_zipcode: club.actual_zipcode,
        free_trial: free_trial,
        category: category,
        subcategories: subcategories,
        short_description: short_description,
        full_description: full_description,
        recurrence: recurrence,
        images: images,
      )
      activity
    end
  end
end
