# == Schema Information
#
# Table name: tarifications
#
#  id           :bigint           not null, primary key
#  amount       :integer
#  recurrence   :string
#  label        :string
#  description  :string
#  sub_group_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Tarification < ApplicationRecord
  belongs_to :sub_group
  validates_presence_of :amount
  validates_presence_of :recurrence
end
