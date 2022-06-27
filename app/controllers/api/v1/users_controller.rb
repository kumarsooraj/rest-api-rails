class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: {error: 'Unable to create user.'}, status: 400
    end
  end


  def update
    if @user.update(user_params)
      render json: @user, status: 200
    else
      render json: {error: 'Unable to  update user.'}, status: 400
    end
  end

  def destroy
    if @user.destroy
      render json: {message: 'User deleted successfully.'}, status: 200
    else
      render json: {error: 'Unable to  uupdate user.'}, status: 400
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
