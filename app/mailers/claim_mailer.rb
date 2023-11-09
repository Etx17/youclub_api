class ClaimMailer < ApplicationMailer

  def new_claim_notification
    mail(to: "youclubdev@gmail.com", subject: 'New Claim Created', message: "coucou")
  end
end
