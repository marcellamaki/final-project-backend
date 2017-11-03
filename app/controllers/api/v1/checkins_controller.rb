require 'time'
class Api::V1::CheckinsController < ApplicationController


    def index
      checkins = Checkin.all
      render json: checkins
    end

    def create
      # byebug
      user = User.find(params[:data].last)

      reminders =  params[:data]
      reminders.pop
      remindersArray = reminders.map{ |i| Question.find(i).reminders }.flatten
      remindersArray.each do |reminder|
        Appointment.create(time: reminder.time, user:user, message: reminder.message)

      end
      render json: "testing"
    end
    
    def checkin_params
      params.require(:data).permit(:reminder_id, :responses)
    end

  end
