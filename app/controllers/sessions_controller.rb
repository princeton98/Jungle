class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:alert] = "Invalid information"
      redirect_to '/sessions/new'
  end
end

  def destroy
    session[:user_id] = nil
    redirect_to "/sessions/new"
  end
end
