class Trainer < ApplicationRecord
  has_one_attached :photo
  belongs_to :activity

  validates :name, presence: true
  validates :photo, presence: true
end
