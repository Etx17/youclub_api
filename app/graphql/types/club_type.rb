class Types::ClubType < Types::BaseObject
  field :id, ID, null: false
  field :name, String, null: false
  field :rnaNumber, String, null: true, method: :rna_number
  field :geoPoint, String, null: true, method: :geo_point
  field :category, String, null: true
  field :address, String, null: true
  field :actualZipcode, String, null: true, method: :actual_zipcode
  field :subcategories, String, null: true
  field :nearbyStation, String, null: true, method: :nearby_station
  field :website, String, null: true
  field :objet, String, null: true
  field :userId, ID, null: false, method: :user_id
  field :images, [String], null: true
  field :activities, [Types::ActivityType], null: true
  field :categoryNumber, String, null: true, method: :category_number
  field :subcategoryNumber, String, null: true, method: :subcategories_number
  field :phoneNumber, String, null: true, method: :phone_number
  field :adherence_fee, Integer, null: true
  field :google_review_client_id, String, null: true
  field :inscription_open_all_year, Boolean, null: true
  field :inscription_start_date, GraphQL::Types::ISO8601Date, null: true
  field :inscription_end_date, GraphQL::Types::ISO8601Date, null: true
  field :retrieved, Boolean, null: true
  field :score, Integer, null: true
  field :status, Integer, null: true
  field :called, Boolean, null: true
  field :comment, String, null: true
  field :onboarding_mail_sent, Boolean, null: true
  field :competitive, Boolean, null: true
  field :slug, String, null: true
  field :city, String, null: true

end
