class Types::ClubType < Types::BaseObject
  field :id, ID, null: false
  field :name, String, null: false
  field :rnaNumber, String, null: true, method: :rna_number
  field :geoPoint, String, null: true, method: :geo_point
  field :category, String, null: true
  field :address, String, null: true
  field :actualZipcode, String, null: true, method: :actual_zipcode
  field :subcategory, String, null: true
  field :nearbyStation, String, null: true, method: :nearby_station
  field :website, String, null: true
  field :objet, String, null: true
  field :userId, ID, null: false, method: :user_id
  field :images, [String], null: true
  field :activities, [Types::ActivityType], null: true
end
