class Api::V1::UsersController < ApplicationController

    def index
      reminder_times = ReminderTimes.all
      if reminder_times.length.zero?
          flash[:alert] = 'You have no reminders. Create one now to get started.'
      render json: reminder_times
    end

    def create
      @user = ReminderTimes.create(reminder_times_params)
    end

    def reminder_times_params
      params.require(:data).permit(:reminder_id, :time)
    end

end


def create
    Time.zone = appointment_params[:time_zone]
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end
