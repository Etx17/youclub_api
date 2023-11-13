# == Schema Information
#
# Table name: schedules
#
#  id           :bigint           not null, primary key
#  sub_group_id :bigint           not null
#  day          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  time_slot_id :bigint
#
class Schedule < ApplicationRecord
  belongs_to :sub_group
  has_many :time_slots, dependent: :destroy
  accepts_nested_attributes_for :time_slots, allow_destroy: true

  validates :day, presence: true
end
