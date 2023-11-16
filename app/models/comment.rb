class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :club

  validates :user_id, uniqueness: { scope: :club_id }
  validates :content, length: { maximum: 1000 }

end
