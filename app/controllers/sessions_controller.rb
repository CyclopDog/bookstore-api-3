class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      render json: { status: 'ok', user: { username: user.username } }
    else
      render json: { status: 'error', errMsgs: ['Invalid username/password combination'] }
    end
  end

  def destroy
    log_out
    render json: { status: 'na', user: {}, errMsgs: [] }
  end
end
