class Api::V1::CheckinsController < ApplicationController

    def index
      checkins = Checkin.all
      render json: checkins
    end

    def create
      user = User.find(params[:data].last)
      reminders =  params[:data]
      reminders.pop
      messages = reminders.map{ |i| Question.find(i).reminders}.as_json.flatten.map{ |i| i["message"]}
      messages.each do |message|
        send_message(user, messages)
      end
    end

    def send_message(user, messages)
        # byebug
        phone_number = user.phone_number
        message = message


    end

    def checkin_params
      params.require(:data).permit(:reminder_id, :created_at, :responses)
    end

  end
