class ClaimMailer < ApplicationMailer

  def new_claim_notification
    mail(to: "etiennededianous@gmail.com", subject: 'New Claim Created', message: "Nouveau claim!")
  end
end
