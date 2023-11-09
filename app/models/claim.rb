class Claim < ApplicationRecord
  belongs_to :user
  belongs_to :club
  after_create_commit :send_notifications

  has_one_attached :verification_document

  enum status: { pending: 0, approved: 1, rejected: 2 }

  # Validations
  validates :verification_document, presence: true

  validates :user_id, uniqueness: { scope: :club_id, message: 'Vous avez déja envoyé une réclamation pour ce club. Vous serez contactés par mail'}

  private

  def send_notifications
    raise
    ClaimNotification.with(claim: self).deliver_later("youclubdev@gmail.com")
  end

end
