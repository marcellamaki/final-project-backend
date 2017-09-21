class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def create
    @user = User.create(user_params)
  end

  def user_params
    params.require(:data).permit(:username, :password_digest, :email, :phone_number)
  end

end
