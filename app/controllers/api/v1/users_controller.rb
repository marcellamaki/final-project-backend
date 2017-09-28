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


  def user_params
   params.require(:data).permit(:username, :password, :email, :phone_number)
  end


end
