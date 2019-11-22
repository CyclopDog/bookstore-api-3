class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(usern_params)
    if user && user.authenticate(userp_params)
      session[:user_id] = user.id
      render json: { status: 'logged' }
    else
      render json: { status: 'not_logged' }
    end
  end

  def destroy
    log_out
    
  end

  private
    def usern_params
      params.require(:usern).permit(:username)
    end

    def userp_params
      params.require(:userp).permit(:password)
    end
end
