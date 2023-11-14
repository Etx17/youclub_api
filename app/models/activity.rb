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
  after_create :add_subcategory_to_club
  before_destroy :remove_subcategory_from_club

  # callback
  def add_subcategory_to_club
    unless club.subcategories.include?(self.subcategories)
      new_subcategories = club.subcategories + [self.subcategories]
      club.update(subcategories: new_subcategories)
    end
  end

  def remove_subcategory_from_club
    # Check if no other activities in the club have the same subcategory
    if club.activities.where.not(id: self.id).where(subcategories: self.subcategories).none?
      # If unique, update the club's subcategories
      updated_subcategories = club.subcategories - [self.subcategories]
      club.update(subcategories: updated_subcategories)
    end
  end
end
