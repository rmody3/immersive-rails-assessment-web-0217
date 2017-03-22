class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "Login Successful"
      redirect_to guests_path
    else
      flash[:notice] = "Invalid username/password"
      redirect_to '/'
    end
  end
end
