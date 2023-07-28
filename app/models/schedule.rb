class Schedule < ApplicationRecord
  belongs_to :sub_group
  has_many :time_slots, dependent: :destroy
end
