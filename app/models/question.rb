class Question < ApplicationRecord
  belongs_to :user
  has_many :reminders
  has_many :reminder_times, through: :reminders

end
