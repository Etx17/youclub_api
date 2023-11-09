# To deliver this notification:
#
# ClaimNotification.with(post: @post).deliver_later(current_user)
# ClaimNotification.with(post: @post).deliver(current_user)

class ClaimNotification < Noticed::Base
  # deliver_by :database
  deliver_by :email, mailer: 'ClaimMailer', method: :new_claim_notification

  # Define any helper methods here. For example:
  def message
    "A new claim has been created."
  end

  # Define URL or any other details you want to include
  # def url
  #   claim_url(params[:claim])
  # end
end
