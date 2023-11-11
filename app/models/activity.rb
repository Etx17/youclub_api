# == Schema Information
#
# Table name: activities
#
#  id                       :bigint           not null, primary key
#  name                     :string
#  geo_point                :string
#  category                 :string
#  address                  :string
#  actual_zipcode           :string
#  free_trial               :boolean
#  is_looking_for_volunteer :boolean
#  subcategories            :string
#  recurrence               :string
#  subscription_link        :string
#  short_description        :text
#  full_description         :text
#  club_id                  :bigint           not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  images                   :string           default([]), is an Array
#  category_number          :string
#  subcategory_number       :string
#  phone_number             :string
#
class Activity < ApplicationRecord
  belongs_to :club
  has_many :sub_groups, dependent: :destroy
  scope :by_zipcode, -> (zipcode) { where(actual_zipcode: zipcode) }
  has_many_attached :photos

end
