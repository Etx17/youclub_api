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
  has_one :club
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  enum role: { user: 0, club: 1, admin: 2 }
end
