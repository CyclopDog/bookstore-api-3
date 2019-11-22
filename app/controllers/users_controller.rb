class UsersController < ApplicationController
  before_action :is_logged, only: [:show]

  def show
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in user
      if session[:user_id]
        render json: { status: 'logged', errors: [] }
      else
        render json: { status: 'not_logged', errors: [] }
      end
    else
      render json: { errors: user.errors.full_messages, status: 'signuperr' }
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

    def is_logged
      if session[:user_id]
        render json: { status: 'logged' }
      else
        render json: { status: 'not_logged' }
      end
    end
end
