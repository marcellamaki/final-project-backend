class Api::V1::RemindersController < ApplicationController

    def index
      reminders = Reminder.all
      render json: reminders
    end

    def create
      reminder = Reminder.create(reminder_params)
    end

    def reminder_params
      params.require(:data).permit(:question_id, :message, :active)
    end

  end
