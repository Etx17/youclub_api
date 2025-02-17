# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  sub_id                 :string
#  role                   :integer          default("user")
#
class User < ApplicationRecord
  has_many :clubs
  has_many :notifications, as: :recipient, dependent: :destroy

  devise :database_authenticatable, :registerable, :trackable,
          :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  enum :role, { user: 0, club: 1, admin: 2}
  has_one :comment
  enum :feeling, { neutre: 0, satisfait: 1, insatisfait: 2 }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email # assuming the user model has an email
      user.avatar_url = auth.info.image # assuming the user model has an image
      user.password = Devise.friendly_token[0, 20] # assuming the user model has a password
      # user.skip_confirmation!
    end
  end

  def owns?(club_id)
    return true if admin?

    club? && clubs.pluck(:id).include?(club_id)
  end

  def send_onboarding_mail
    p 'sending onboarding mail...'
    postmark_client = Postmark::ApiClient.new(Rails.application.credentials.dig(:postmark_api_token))
    postmark_client.deliver_with_template(
      from: 'contact@youclub.fr',
      to: self.email,
      template_alias: 'Y-01-onboarding-credentials',
      template_model: {
        action_url: Rails.application.routes.url_helpers.new_user_session_url,
        user_email: self.email,
      }
    )
  end
end

# 10172 est l'id a partir du quel si c'est en dessous j'envoie pas le mail.
# User.all.each do |user|
#   if user.id > 11299 && user.club?
#     user.send_onboarding_mail
#   end
# end
