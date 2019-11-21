class UsersController < ApplicationController
  def show

  end

  def new
    if @status = 'ok'
      render json: { username: current_user.username }
    else
      render json: { errMsgs: @user.errors.full_messages }
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in @user
      @status = 'ok'
    else
      @status = 'error'
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
