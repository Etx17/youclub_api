class Tarification < ApplicationRecord
  belongs_to :sub_group
  validates_presence_of :amount
  validates_presence_of :recurrence
end
