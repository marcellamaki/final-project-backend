class Reminder < ApplicationRecord
  belongs_to :question
  has_many :reminder_times
end
