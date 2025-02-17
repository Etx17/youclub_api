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
  extend FriendlyId
  friendly_id :generate_activity_slug, use: :slugged
  belongs_to :club
  has_many :sub_groups, dependent: :destroy
  has_many :trainers, dependent: :destroy
  has_many_attached :photos

  scope :by_zipcode, -> (zipcode) { where(actual_zipcode: zipcode) }
  after_create :add_subcategory_to_club
  after_update :update_subcategories_of_club
  before_destroy :remove_subcategory_from_club
  after_update :update_club_score

  accepts_nested_attributes_for :trainers, allow_destroy: true


  # callback ok?
  def update_subcategories_of_club
    add_subcategory_to_club
    remove_subcategory_from_club
  end

  def add_subcategory_to_club
    unless club.subcategories.include?(self.subcategories)
      new_subcategories = club.subcategories + [self.subcategories]
      club.update(subcategories: new_subcategories)
    end
  end

  def remove_subcategory_from_club

    # Get all subcategories from other activities in the club, excluding the current activity
    other_subcategories = club.activities.where.not(id: self.id).pluck(:subcategories).uniq

    # Check if the current activity's subcategory is unique
    if other_subcategories.exclude?(self.subcategories)
      # If unique, remove it from the club's subcategories
      updated_subcategories = club.subcategories - [self.subcategories]
      club.update(subcategories: updated_subcategories)
    end
  end

  def generate_activity_slug
    # Activity.all.each do |a|
    #   a.update_column(:slug, a.generate_activity_slug)
    # end
    base_slug = "#{name}-#{club.city}-#{club.name.first(30)}".parameterize
    # if Activity.exists?(slug: base_slug)
    #   # If the slug is already taken, add a random number to the end
    #   "#{base_slug}-#{rand(1000)}"
    # else
    #   base_slug
    # end
  end


  private

  def update_club_score
    club.calculate_score
  end
end
