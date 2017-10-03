class Appointment < ApplicationRecord
  belongs_to :user


  after_create :send_message


  def send_message
      @twilio_number = 4132079712
      account_sid = AC11552a039a86f50ca96560e2324eed3a
      @client = Twilio::REST::Client.new account_sid, d1d405f6d3aec7fd91ca190d1a287b19
      phone_number = user.phone_number.split("-").unshift("+1").join("")
      byebug
      text = message

      message = @client.api.account(account_sid).messages.create(
       :from => @twilio_number,
       :to => phone_number,
       :body => text,
   )
   render json: text
 end

 def when_to_run
   #Time.parse(time)
  #  byebug
   Time.now
 end


 handle_asynchronously :send_message, :run_at => Proc.new { |i| i.when_to_run }
end
