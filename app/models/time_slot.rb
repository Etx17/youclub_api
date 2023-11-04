# == Schema Information
#
# Table name: time_slots
#
#  id          :bigint           not null, primary key
#  schedule_id :bigint
#  start_time  :string
#  end_time    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class TimeSlot < ApplicationRecord
  belongs_to :schedule
end
