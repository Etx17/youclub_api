class User < ApplicationRecord
  has_one :club
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  enum role: { user: 0, club: 1, admin: 2 }
end
