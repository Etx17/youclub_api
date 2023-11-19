class Trainer < ApplicationRecord
  has_one_attached :photo
  belongs_to :activity
end
