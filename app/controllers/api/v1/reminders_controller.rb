class Api::V1::RemindersController < ApplicationController

    def index
      reminders = Reminder.all
      render json: reminders
    end

    def create
      byebug
      reminder = Reminder.create(reminder_params)
      render json: reminder
    end

    def reminder_params
      params.require(:data).permit(:question_id, :answer, :active, :reminder, :reminder_time)
    end

  end
