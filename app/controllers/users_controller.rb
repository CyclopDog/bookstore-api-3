class UsersController < ApplicationController
  def show
    render json: User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { user: @user.username, status: 'ok' }
    else
      render json: { status: 'error', errMsgs: @user.errors.full_messages }
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
