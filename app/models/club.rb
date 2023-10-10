class Club < ApplicationRecord
  belongs_to :user
  has_many :activities, dependent: :destroy

  enum structure_type: {
    association: 0,
    club: 1,
  }
end
