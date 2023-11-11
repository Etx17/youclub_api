class Claim < ApplicationRecord
  after_create_commit :send_notifications

  belongs_to :user
  belongs_to :club

  has_one_attached :verification_document
  enum status: { pending: 0, approved: 1, rejected: 2 }

  # Validations
  validates :verification_document, presence: true
  validates :user_id, uniqueness: { scope: :club_id, message: 'Vous avez déja envoyé une réclamation pour ce club. Vous serez contactés par mail'}

  def accept_claim!
    update!(status: :approved)
    club.update!(user: user)
  end

  def send_notifications
    ClaimNotification.with(claim: self).deliver("etiennededianous@gmail.com")
  end

end
