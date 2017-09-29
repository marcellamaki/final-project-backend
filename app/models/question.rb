class Question < ApplicationRecord
  belongs_to :user
  has_many :reminders
  has_many :checkins, through: :reminders

end
