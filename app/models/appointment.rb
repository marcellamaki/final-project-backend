require 'twilio-ruby'


class Appointment < ApplicationRecord
  belongs_to :user


  after_create :send_message


  def send_message

      # @twilio_number = "+14132079712"
      account_sid = "AC11552a039a86f50ca96560e2324eed3a"
      auth_token = "d1d405f6d3aec7fd91ca190d1a287b19"
      @client = Twilio::REST::Client.new account_sid, auth_token
      phone_number = self.user.phone_number.split("-").unshift("+1").join("")
      text = self.message
      # byebug

      message = @client.api.account.messages.create(
       :from => "+14132079712",
       :to => phone_number,
       :body => text)
     puts message.to
 end

 def when_to_run
   Time.parse(self.time)
 end


  handle_asynchronously :send_message, :run_at => Proc.new {  |i| i.when_to_run }
end
