class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(user_params)
      payload = { user_id: @user.id}
      token = issue_token(payload)
      render json: {user: @user, jwt: token}
  end

  def me
      render json: current_user
  end

    def authenticate
      @user = User.find_by(username: params[:data][:username])

      if @user && @user.authenticate(params[:data][:password])
       payload = { user_id: @user.id}
       token = issue_token(payload)
       render json: {user: @user, jwt: token}
     else
       render json: {error: "User Does Not Exist"}
     end
  end

  def get_user
    if current_user
        render json: {user: current_user, questions:current_user.questions, reminders: current_user.reminders}
      else
        render json: {failure: "Error"}
      end
    end

    def set_checkin_reminders
      user = User.find(params[:data].last)
      reminders =  params[:data]
      reminders.pop
      messages = reminders.map{ |i| Question.find(i).reminders}.as_json.flatten.map{ |i| i["message"]}
      byebug
      send_message

      render json: messages

    end

  #   def send_message
  #   @twilio_number = 4132079712
  #   account_sid = AC11552a039a86f50ca96560e2324eed3a
  #   @client = Twilio::REST::Client.new account_sid, d1d405f6d3aec7fd91ca190d1a287b19
  #   byebug
  #   time_str = ((self.time).localtime).strftime("%I:%M%p on %b. %d, %Y")
  #   reminder = "Hi #{self.name}. Just a reminder that you have an appointment coming up at #{time_str}."
  #   message = @client.api.account(account_sid).messages.create(
  #     :from => @twilio_number,
  #     :to => self.phone_number,
  #     :body => reminder,
  #   )
  #   end
  #
  #   def when_to_run
  #     minutes_before_appointment = 0.minutes
  #     time - minutes_before_appointment
  #   end
  #
  # handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }


private

  def user_params
   params.require(:data).permit(:username, :password, :email, :phone_number, :responses)
  end


end
