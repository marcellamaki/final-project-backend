class Api::V1::AppointmentsController < ApplicationController

    def index
      appointments = Appointment.all
      render json: appointments
    end

    def create
      appointment = Appointment.create(appointment_params)
      render json: reminder
    end

    def appointment_params
      params.require(:data).permit(:time, :user :message)
    end

  end
