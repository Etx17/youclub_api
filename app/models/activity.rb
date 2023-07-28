class Activity < ApplicationRecord
  belongs_to :club
  has_many :sub_groups, dependent: :destroy
  scope :by_zipcode, -> (zipcode) { where(actual_zipcode: zipcode) }
end
