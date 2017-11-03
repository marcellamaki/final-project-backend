require 'twilio-ruby'


class Appointment < ApplicationRecord
  belongs_to :user


  after_create :send_message




 def when_to_run
   Time.parse(self.time)
 end


  handle_asynchronously :send_message, :run_at => Proc.new {  |i| i.when_to_run }
end
