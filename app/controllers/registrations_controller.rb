class RegistrationsController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to "/"
    else
      flash[:alert] = "Invalid information"
      redirect_to "/registration/new"
  end
end

  private
    def user_params
      params.require(:registration).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
