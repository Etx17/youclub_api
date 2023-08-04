module Mutations
  class UpdateClub < BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :category, String, required: false
    argument :subcategory, String, required: false
    argument :website, String, required: false
    argument :objet, String, required: false
    argument :images, [String], required: false

    type Types::ClubType

    def resolve(id:, name: nil, category: nil, subcategory: nil, website: nil, objet: nil, images: nil)
      club = Club.find(id)
      club.update!(
        name: name || club.name,
        category: category || club.category,
        subcategory: subcategory || club.subcategory,
        website: website || club.website,
        objet: objet || club.objet,
        images: images || club.images
      )
      club
    end
  end
end
