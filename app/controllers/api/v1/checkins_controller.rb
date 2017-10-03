require 'time'
class Api::V1::CheckinsController < ApplicationController


    def index
      checkins = Checkin.all
      render json: checkins
    end

    def create

      user = User.find(params[:data].last)

      reminders =  params[:data]
      reminders.pop
      # message_text = reminders.map{ |i| Question.find(i).reminders }.as_json.flatten.map{ |i| i["message"]}
      remindersArray = reminders.map{ |i| Question.find(i).reminders }.flatten
      byebug
      remindersArray.each do |reminder|
        Appointment.create(time: reminder.time, user:user, message: reminder.message)
      end
      # message_text.each do |text|
      #   # data = Reminder.find
      #
      #
      #
      #   # Appt is just a reminder all it needs is a time ....to be clear lets give it some text and a user
      #
      #   # send_message(user, text)
      # end
    end

  #   def send_message(user, text)
  #       byebug
  #       @twilio_number = 4132079712
  #       account_sid = AC11552a039a86f50ca96560e2324eed3a
  #       @client = Twilio::REST::Client.new account_sid, d1d405f6d3aec7fd91ca190d1a287b19
  #       phone_number = user.phone_number
  #       text = text
   #
  #       message = @client.api.account(account_sid).messages.create(
  #        :from => @twilio_number,
  #        :to => phone_number,
  #        :body => text,
  #    )
   #
  #  end
   #
  #  def when_to_run
  #    Time.parse()
  #  end
   #
   #
  #  handle_asynchronously :send_message, :run_at => Proc.new { |i| i.when_to_run }


    def checkin_params
      params.require(:data).permit(:reminder_id, :responses)
    end

  end
