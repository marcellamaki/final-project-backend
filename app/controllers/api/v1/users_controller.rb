class Api::V1::UsersController < ApplicationController
  before_action :authorized, only: [:me]

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(user_params)
      payload = { user_id: @user.id}
      render json: {user: @user}
  end

  def me
      render json: current_user
  end

    def authenticate
      user = User.find_by(params[:username])

        payload = { user_id: user.id}
        token = issue_token(payload)
        render json: {user: user, jwt: token}

    end

  def user_params
   params.require(:data).permit(:username, :password, :email, :phone_number)
  end


end
