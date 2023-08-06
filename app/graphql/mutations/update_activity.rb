module Mutations
  class UpdateActivity < BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :category, String, required: false
    argument :subcategories, String, required: false
    argument :full_description, String, required: false
    argument :address, String, required: false
    argument :images, [String], required: false
    argument :free_trial, Boolean, required: false

    type Types::ActivityType

    def resolve(id:, name: nil, free_trial: nil, category: nil, subcategories: nil, address: nil, full_description: nil, images: [])
      activity = Activity.find(id)
      activity.update!(
        name: name || activity.name,
        category: category || activity.category,
        subcategories: subcategories || activity.subcategories,
        full_description: full_description || activity.full_description,
        images: images || activity.images,
        free_trial: free_trial || activity.free_trial,
        # address: address || activity.address
      )
      activity
    end
  end
end
