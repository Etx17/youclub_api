class User < ApplicationRecord
  has_one :club
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
