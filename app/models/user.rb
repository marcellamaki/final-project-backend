class User < ApplicationRecord
  has_secure_password
  has_many :questions
  has_many :reminders, through: :questions
  has_many :checkins, through: :reminders

  validates :email, uniqueness: true
  validates :username, uniqueness: true

end
