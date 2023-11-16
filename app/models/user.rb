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
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  enum role: { user: 0, club: 1}
  has_one :comment
  enum feeling: {
    neutre: 0,
    satisfait: 1,
    insatisfait: 2
  }

  validates :user_id, uniqueness: { scope: :club_id }
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email # assuming the user model has an email
      user.avatar_url = auth.info.image # assuming the user model has an image
      user.password = Devise.friendly_token[0, 20] # assuming the user model has a password
      # user.skip_confirmation!
    end
  end

  def owns?(club_id)
    club? && clubs.pluck(:id).include?(club_id)
  end
end
