class SubGroup < ApplicationRecord
  belongs_to :activity
  has_many :schedules, dependent: :destroy
  attribute :tarifications, array: true
end
