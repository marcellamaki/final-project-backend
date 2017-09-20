class Api::V1::UsersController < ApplicationController

    def index
      reminder_times = ReminderTimes.all
      render json: reminder_times
    end

    def create
      @user = ReminderTimes.create(reminder_times_params)
    end

    def reminder_times_params
      params.require(:data).permit(:reminder_id, :time)
    end

end
