class Claim < ApplicationRecord
  belongs_to :user
  belongs_to :club
  has_one_attached :verification_document

  enum status: { pending: 0, approved: 1, rejected: 2 }
end
